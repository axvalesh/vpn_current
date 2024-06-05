import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/service/service.dart';

import '../../account/account.dart';
import '../../faq/faq.dart';
import '../../premium/premium.dart';
import '../../settings/settings.dart';
import '../widgets/widgets.dart';

class SebekMenu extends StatelessWidget {
  const SebekMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/images/back_arrow.svg'),
          ),
          title: Text(
            LocaleKeys.connect_page_menu_title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ).tr(),
        ),
        body: Column(
          children: [
            SebekMenuCard(
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              leading: SvgPicture.asset('assets/images/menu_person.svg'),
              text: LocaleKeys.connect_page_menu_account.tr(),
              onTap: () => Navigator.pushNamed(context, AccountPage.route),
            ),
            SebekMenuCard(
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              leading: SvgPicture.asset('assets/images/menu_crown.svg'),
              text: LocaleKeys.connect_page_menu_premium.tr(),
              onTap: () => Navigator.popAndPushNamed(context, OfferPage.route),
            ),
            SebekMenuCard(
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              leading: SvgPicture.asset('assets/images/menu_cog.svg'),
              text: LocaleKeys.connect_page_menu_settings.tr(),
              onTap: () => Navigator.pushNamed(context, SettingsPage.route),
            ),
            SebekMenuCard(
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              leading: SvgPicture.asset('assets/images/menu_faq.svg'),
              text: LocaleKeys.connect_page_menu_faq.tr(),
              onTap: () => Navigator.pushNamed(context, FaqPage.route),
            ),
            SebekMenuCard(
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              leading: SvgPicture.asset('assets/images/menu_star.svg'),
              text: LocaleKeys.connect_page_menu_rate.tr(),
              onTap: () async {
                await showRating();
              },
            ),
          ],
        ),
      ),
    );
  }
}
