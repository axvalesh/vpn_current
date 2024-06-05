import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/premium/views/offer_page.dart';

class OfferBanner extends StatefulWidget {
  const OfferBanner({Key? key, this.margin}) : super(key: key);

  final EdgeInsets? margin;

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OfferPage.route);
      },
      child: Container(
        margin: widget.margin,
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          backgroundBlendMode: BlendMode.color,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              SebekColors.accent,
              BlendMode.multiply,
            ),
            fit: BoxFit.cover,
            image: const AssetImage(
              'assets/images/offer_bg.png',
            ),
          ),
          color: SebekColors.accent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/crown_medium_bg.svg'),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                LocaleKeys.connect_page_offer_title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: SebekColors.active),
              ).tr(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                LocaleKeys.connect_page_offer_desc,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: SebekColors.active,
                ),
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
