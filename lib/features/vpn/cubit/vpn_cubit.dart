import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/service.dart';

import '../ticker.dart';

part 'vpn_state.dart';

class VpnCubit extends Cubit<VpnState> {
  VpnCubit() : super(VpnState());

  isConnecting() {
    var connectingStages = [
      VPNStage.connecting,
      VPNStage.authentication,
      VPNStage.authenticating,
      VPNStage.unknown,
      VPNStage.vpn_generate_config,
      VPNStage.wait_connection,
      VPNStage.tcp_connect,
      VPNStage.udp_connect,
      VPNStage.assign_ip,
      VPNStage.get_config,
      VPNStage.prepare,
      VPNStage.resolve,
    ];
    return connectingStages.contains(state.stage);
  }

  isConnected() {
    print(state.stage);

    return state.stage == VPNStage.connected;
  }

  isDisconnected() {
    var disconnectedStages = [
      VPNStage.disconnected,
      VPNStage.disconnecting,
      VPNStage.denied,
      VPNStage.error,
      VPNStage.exiting,
    ];
    return disconnectedStages.contains(state.stage);
  }

  changeStatus(VpnStatus? status, int ping, String server) {
    if (status != null && status.connectedOn != null) {
      emit(VpnState(stage: state.stage, status: status, ip: state.ip, ping: ping, serverName: server));
    }
  }

  changeStage(stage) {
    var newState = VpnState(stage: stage, status: state.status, ip: state.ip, ping: state.ping, serverName: state.serverName);
    emit(newState);
  }
}
