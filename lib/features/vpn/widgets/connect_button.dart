import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/constants/colors.dart';

import '../cubit/vpn_cubit.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  BoxDecoration _circleDecoration() {
    return BoxDecoration(
      gradient: SebekColors.accentGradient,
      shape: BoxShape.circle,
    );
  }

  double _mediaWidth(BuildContext context) {
    const double maxScreenSize = 900;
    double height = MediaQuery.of(context).size.height;
    double diameter = MediaQuery.of(context).size.width;

    if (maxScreenSize > height) diameter = diameter * height/900;
    return diameter;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: BlocBuilder<VpnCubit, VpnState>(
        builder: (context, state) {
          return AvatarGlow(
            animate: VPN_CUBIT.isConnected(),
            endRadius: _mediaWidth(context) * .425,
            showTwoGlows: false,
            glowColor: SebekColors.accent,
            child: Container(
              width: _mediaWidth(context) * .85,
              height: _mediaWidth(context) * .85,
              alignment: Alignment.center,
              decoration: _circleDecoration(),
              child: Container(
                width: _mediaWidth(context) * .65,
                height: _mediaWidth(context) * .65,
                alignment: Alignment.center,
                decoration: _circleDecoration(),
                child: Container(
                  width: _mediaWidth(context) * .45,
                  height: _mediaWidth(context) * .45,
                  alignment: Alignment.center,
                  decoration: _circleDecoration(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onTap,
                    child: Container(
                      width: _mediaWidth(context) * .25,
                      height: _mediaWidth(context) * .25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: SebekColors.accent,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositionedDirectional(
                            curve: Curves.easeInOutQuad,
                            top: state.stage == VPNStage.disconnected
                                ? _mediaWidth(context) * .25
                                : _mediaWidth(context) * .125 - 16,
                            duration: const Duration(milliseconds: 300),
                            child: SvgPicture.asset('assets/images/switch.svg'),
                          ),
                          AnimatedPositionedDirectional(
                            curve: Curves.easeInOutQuad,
                            bottom: state.stage != VPNStage.disconnected
                                ? _mediaWidth(context) * .25
                                : _mediaWidth(context) * .125 - 16,
                            duration: const Duration(milliseconds: 300),
                            child: SvgPicture.asset('assets/images/rocket.svg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
