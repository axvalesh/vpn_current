import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';

import '../cubit/vpn_cubit.dart';

class ConnectionBadge extends StatelessWidget {
  const ConnectionBadge({Key? key}) : super(key: key);

  Widget _connectionIcon(BuildContext context) {
    if (VPN_CUBIT.isConnecting()) {
      return SizedBox(
          height: 24,
          width: 24,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircularProgressIndicator(
              color: SebekColors.accent,
              strokeWidth: 1,
            ),
          ));
    } else if (VPN_CUBIT.isConnected()) {
      return SvgPicture.asset('assets/images/checked_circle.svg');
    } else {
      return SvgPicture.asset('assets/images/close_circle.svg');
    }
  }

  String _connectionText(BuildContext context) {
    if (VPN_CUBIT.isConnecting()) {
      return LocaleKeys.connect_page_connection_connecting;
    } else if (VPN_CUBIT.isConnected()) {
      return LocaleKeys.connect_page_connection_connected;
    } else {
      return LocaleKeys.connect_page_connection_not_connected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VpnCubit, VpnState>(
  builder: (context, state) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: SebekColors.secondary,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _connectionIcon(context),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              _connectionText(context),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 14),
            ).tr(),
          ),
        ],
      ),
    );
  },
);
  }
}
