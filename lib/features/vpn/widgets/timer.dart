import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';

import '../cubit/vpn_cubit.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  String _formatTime(Duration d) =>
      d.toString().split('.').first.padLeft(8, "0");

  // String _getConnectionTime(BuildContext context) {
  //   Duration connectionDuration =
  //       Duration(seconds: context.read<VpnCubit>().state.duration);
  //   return _formatTime(connectionDuration);
  // }
  //
  // String _getConnectionHours(BuildContext context) =>
  //     _getConnectionTime(context).split(':')[0];
  //
  // String _getConnectionMinutes(BuildContext context) =>
  //     _getConnectionTime(context).split(':')[1];
  //
  // String _getConnectionSeconds(BuildContext context) =>
  //     _getConnectionTime(context).split(':')[2];

  TextStyle _timerTextStyle() {
    return GoogleFonts.poppins(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      // height: 60
    );
  }

  Widget _timerFraction(String fraction) {
    return Expanded(
      child: Text(
        fraction,
        textAlign: TextAlign.center,
        style: _timerTextStyle(),
      ),
    );
  }

  Widget _colonDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        ':',
        style: _timerTextStyle(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VpnCubit, VpnState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.status!.duration!,
                  style: _timerTextStyle(),
                ),
                // _timerFraction(_getConnectionHours(context)),
                // _colonDivider(),
                // _timerFraction(_getConnectionMinutes(context)),
                // _colonDivider(),
                // _timerFraction(_getConnectionSeconds(context)),
              ],
            ),
          ],
        );
      },
    );
  }
}
