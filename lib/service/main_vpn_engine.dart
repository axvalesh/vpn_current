import 'dart:async' as dartAsync;
import 'dart:io';

import 'package:check_vpn_connection/check_vpn_connection.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/settings/cubit/settings_cubit.dart';
import 'package:sebek_vpn/features/settings/enums/connection_timeout.dart';
import 'package:sebek_vpn/features/settings/enums/vpn_protocol.dart';
import 'package:sebek_vpn/features/vpn/cubit/vpn_cubit.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/ad_mob.dart';
import 'package:sebek_vpn/service/ios_vpn_engine.dart';
import 'package:sebek_vpn/service/service.dart';
import 'package:sebek_vpn/service/user_shared_storage.dart';

class MainVPNEngine {
  IOSVPNEngine IOSEngine = IOSVPNEngine();
  late Map? serverData;
  dartAsync.Timer? _timer;
  OpenVPN? engine;
  String currentServer = '';
  bool isConnected = false;
  bool forceVisualDisconnect = false;
  BuildContext? context;

  Future<void> initPlatformState(config, username, password) async {
    var certIsRequired = username == '' && password == '';
    engine!.connect(config, "VPN",
        username: username, password: password, certIsRequired: certIsRequired);
  }

  void initializeEngine() {
    engine = OpenVPN(
      onVpnStatusChanged: (data) async {
        await vpnStatusChange(data);
      },
      onVpnStageChanged: (stage, stage1) {
        vpnStageChange(stage);
      },
    );

    engine!.initialize(
      groupIdentifier: "group.sebekvpn.feelweel.com",
      providerBundleIdentifier: "sebekvpn.feelweel.com.VPNExtension",
      localizedDescription: "SebekVPN",
    );
  }

  createInterstitialAd({required VoidCallback onDone}) {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {},
            onAdImpression: (ad) {},
            onAdFailedToShowFullScreenContent: (ad, err) {
              onDone();
              ad.dispose();
            },
            onAdDismissedFullScreenContent: (ad) {
              onDone();
              ad.dispose();
            },
          );
          ad.show();
        },
        onAdFailedToLoad: (LoadAdError error) {},
      ),
    );
  }

  startVPN({addOnConfig = '', protocol}) async {
    VPN_CUBIT.changeStage(VPNStage.connecting);

    String dateAdString = UserSharedStorage.getDateAdShow();
    DateTime? dateShow;
    if (dateAdString != '') {
      dateShow = startVPNDateFormat.parse(dateAdString);
    }

    bool isFree = !SERVER_CUBIT.state.selectedServer!.isPersonal && !SERVER_CUBIT.state.selectedServer!.isPremium;
    if ((dateShow == null || dateShow.difference(DateTime.now()).inMinutes.abs() > 30) && isFree) {
      print('start ad');
      await UserSharedStorage.setDateAdShow(
          startVPNDateFormat.format(DateTime.now()));
      await createInterstitialAd(
        onDone: () {
          startLogicBody(addOnConfig, protocol);
        },
      );
    } else {
      startLogicBody(addOnConfig, protocol);
    }
    return;
  }

  startLogicBody(addOnConfig, protocol) async {
    if (engine == null) {
      initializeEngine();
    }

    if (Platform.isIOS) {
      startLogic(addOnConfig, protocol);
    } else {
      await engine!.requestPermissionAndroid().then((value) async {
        startLogic(addOnConfig, protocol);
      });
    }
    return;
  }

  startLogic(addOnConfig, defaultProtocol) async {
    await UserSharedStorage.setCurrentServer(
        SERVER_CUBIT.state.selectedServer!.id);
    VPN_CUBIT.state.ip = '';
    currentServer = '';

    var serverData =
        await apiHandler.getCredentials(SERVER_CUBIT.state.selectedServer!);
    if (serverData == null) {
      showAlert(
          text: LocaleKeys.error_no_permission.tr(),
          context: context,
          error: true);
      return;
    }

    if (serverData != null) {
      var config, protocol = SETTINGS_CUBIT.state.vpnProtocol;

      if (defaultProtocol == null) {
        if (protocol == VpnProtocol.udp || protocol == VpnProtocol.adaptive) {
          config = serverData!['config_udp'];
        } else {
          config = serverData!['config_tcp'];
        }
      } else {
        if (defaultProtocol == VpnProtocol.udp) {
          config = serverData!['config_udp'];
        } else {
          config = serverData!['config_tcp'];
        }
      }
      initPlatformState(config + addOnConfig, serverData!['username'],
          serverData!['password']);
      startTimer();
    }
  }

  vpnStatusChange(data) async {
    // if (VPN_CUBIT.isDisconnected()) {
    //   return null;
    // }

    if (VPN_CUBIT.state.ip == '') {
      VPN_CUBIT.state.ip = await getIp();
    }

    if (currentServer == '') {
      for (SimpleLocation location in SERVER_CUBIT.state.locations) {
        for (Server server in location.servers) {
          if (server.id == UserSharedStorage.getCurrentServer()) {
            currentServer = server.title;
          }
        }
      }
      for (PersonalLocation location in SERVER_CUBIT.state.personalLocations) {
        for (Server server in location.servers) {
          if (server.id == UserSharedStorage.getCurrentServer()) {
            currentServer = server.title;
          }
        }
      }
    }

    int ping = 60;
    if (SETTINGS_CUBIT.state.pingConnection) {
      var pingObject = await Ping(VPN_CUBIT.state.ip, count: 1).stream.first;
      if (pingObject.response != null && pingObject.response!.time != null) {
        ping = pingObject.response!.time!.inMilliseconds;
      }
    }

    VPN_CUBIT.changeStatus(data, ping, currentServer);
  }

  vpnStageChange(stage) {
    if (forceVisualDisconnect) {
      if (stage == VPNStage.connected) {
        engine!.disconnect();
      }
      VPN_CUBIT.changeStage(VPNStage.disconnected);
      return;
    }

    VPN_CUBIT.changeStage(stage);

    if (!isConnected && stage == VPNStage.connected) {
      isConnected = true;
      UserSharedStorage.setDateVPNStart(
          startVPNDateFormat.format(DateTime.now()));
    }

    if (stage == VPNStage.disconnected) {
      if (_timer != null) {
        _timer!.cancel();
        IOSEngine.dispose();
      }
      isConnected = false;
    }
  }

  void startTimer() {
    int countSeconds = 0;
    const oneSec = Duration(seconds: 1);
    _timer = dartAsync.Timer.periodic(
      oneSec,
      (dartAsync.Timer timer) async {
        countSeconds++;

        if (VPN_CUBIT.isConnected()) {
          _timer!.cancel();
          return;
        }

        if (SETTINGS_CUBIT.state.vpnProtocol == VpnProtocol.adaptive &&
            countSeconds == 10) {
          engine!.disconnect();
          await Future.delayed(Duration(milliseconds: 500));
          await startVPN(protocol: VpnProtocol.tcp);
        }

        var timeout = SETTINGS_CUBIT.state.connectionTimeout;

        bool firstCheck =
                timeout == ConnectionTimeout.s10 && countSeconds >= 10,
            secondCheck =
                timeout == ConnectionTimeout.s30 && countSeconds >= 30,
            thirdCheck = timeout == ConnectionTimeout.m1 && countSeconds >= 60,
            fourthCheck =
                timeout == ConnectionTimeout.m2 && countSeconds >= 120;

        if (firstCheck || secondCheck || thirdCheck || fourthCheck) {
          if (VPN_CUBIT.isConnecting()) {
            engine!.disconnect();
          }
        }
      },
    );
  }

  getIp() async {
    String ip = await Ipify.ipv4();
    return ip;
  }

  enableVpnWhenStart() async {
    VPN_CUBIT.state.status =
        VpnStatus(byteIn: '0', byteOut: '0', duration: "--:--:--");

    bool isVPN = await CheckVpnConnection.isVpnActive();

    if (isVPN) {
      if (Platform.isIOS) {
        VPN_CUBIT.state.ip = '';
        currentServer = '';
        isConnected = true;
        IOSEngine.initialize(vpnStatusChange);
        vpnStageChange(VPNStage.connected);
        await Future.delayed(Duration(seconds: 5));
        startVPN();
      } else {
        print('123 TEST');
        initializeEngine();
        // startVPN();
      }
    } else if (SETTINGS_CUBIT.state.connectWhenVpnStarts && !isVPN) {
      startVPN();
    }
  }

  void switchConnect() async {
    if (VPN_CUBIT.isConnecting() || VPN_CUBIT.isConnected()) {
      if (engine != null) {
        engine!.disconnect();
      } else {
        vpnStageChange(VPNStage.disconnected);
        IOSEngine.dispose();
        forceVisualDisconnect = true;
        isConnected = false;
        startVPN();
      }
      return;
    } else {
      if (forceVisualDisconnect) {
        bool isVPN = await CheckVpnConnection.isVpnActive();
        if (!isVPN) {
          forceVisualDisconnect = false;
          await startVPN();
        } else {
          // showAlert(text: LocaleKeys.try_again_reconnect.tr(), context: context, error: true);
        }
      } else {
        await startVPN();
      }
    }
  }
}

MainVPNEngine mainVPNEngine = MainVPNEngine();
