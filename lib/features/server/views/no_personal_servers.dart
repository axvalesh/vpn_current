import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';

import '../../premium/premium.dart';

class NoPersonalServers extends StatelessWidget {
  const NoPersonalServers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/folder_empty.svg'),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              LocaleKeys.select_server_page_personal_blank_title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              LocaleKeys.select_server_page_personal_blank_description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ).tr(),
          ),
          AccentButton(
            onTap: () => Navigator.pushNamed(context, OfferPage.route),
            margin: const EdgeInsets.only(top: 16),
            text: LocaleKeys.select_server_page_personal_blank_action.tr(),
          )
        ],
      ),
    );
  }
}
