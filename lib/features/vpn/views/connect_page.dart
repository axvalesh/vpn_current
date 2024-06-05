import 'dart:async' as dartAsync;
import 'dart:async';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:check_vpn_connection/check_vpn_connection.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/settings/cubit/settings_cubit.dart';
import 'package:sebek_vpn/features/settings/enums/connection_timeout.dart';
import 'package:sebek_vpn/features/settings/enums/vpn_protocol.dart';
import 'package:sebek_vpn/features/vpn/views/speed_test_page.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/ad_mob.dart';
import 'package:sebek_vpn/service/ios_vpn_engine.dart';
import 'package:sebek_vpn/service/main_vpn_engine.dart';
import 'package:sebek_vpn/service/service.dart';
import 'package:sebek_vpn/service/user_shared_storage.dart';

import '../../notifications/notifications.dart';
import '../../server/server.dart';
import '../cubit/vpn_cubit.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class ConnectPage extends StatefulWidget {
  static const String route = '/vpn';

  const ConnectPage({Key? key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  void initState() {
    super.initState();
    // createInterstitialAd();
    debugPrint('init');
  }

  void _openScaffold(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  Widget _topPanel(bool displayStats) {
    debugPrint('top panel is ${SUBSCRIPTION_CUBIT.state.isSubscribe} but it has to be true');
    if (displayStats) {
      return const StatsPanel(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      );
    } else if (!SUBSCRIPTION_CUBIT.state.isSubscribe) {
      return const OfferBanner(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      );
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    mainVPNEngine.context = context;

    return Scaffold(
      drawer: const SebekMenu(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return TextButton(
            onPressed: () => _openScaffold(context),
            child: SvgPicture.asset('assets/images/burger.svg'),
          );
        }),
        title: Text(
          LocaleKeys.connect_page_title,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ).tr(),
        actions: [
          Row(
            children: [
              Container(
                width: 35,
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SpeedTestPage.route),
                  child: Icon(
                    Icons.speed,
                    color: SebekColors.tertiary.withOpacity(0.8),
                  ),
                ),
              ),
              Container(
                width: 60,
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, NotificationsPage.route),
                  child: const NotificationsBell(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<VpnCubit, VpnState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        _topPanel(VPN_CUBIT.isConnected()),
                        const ConnectionBadge(),
                      ],
                    );
                  },
                ),
                ConnectButton(onTap: () {
                  mainVPNEngine.switchConnect();
                }),
              ],
            ),
          ),
          Column(
            children: [
              SelectedServerCard(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                onChangeTapped: () =>
                    Navigator.of(context).pushNamed(SelectServerPage.route),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
