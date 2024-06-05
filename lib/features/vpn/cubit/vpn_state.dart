part of 'vpn_cubit.dart';


class VpnState {
  VpnState({this.stage=VPNStage.disconnected, this.status, this.ip='', this.ping=60, this.serverName=''});

  VPNStage stage;
  VpnStatus? status;
  String ip;
  int ping;
  String serverName;
}
