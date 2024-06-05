import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/vpn/cubit/vpn_cubit.dart';

class ConnectionIp extends StatelessWidget {
  const ConnectionIp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VpnCubit, VpnState>(
      builder: (context, state) {
        return Text(
          '${LocaleKeys.connect_page_stats_ip.tr()} ${"${state.ip} (${state.serverName})"}',
          style: GoogleFonts.poppins(
            color: SebekColors.tertiary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        );
      },
    );
  }
}
