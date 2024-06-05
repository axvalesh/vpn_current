import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    Key? key,
    this.margin,
  }) : super(key: key);

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: SebekColors.tertiary,
          ),
          children: [
            TextSpan(text: LocaleKeys.sign_in_terms_text.tr()),
            const TextSpan(text: ' '),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () async {
                String url = "https://sebekvpn.com/tos.html";
                await launchUrlString(url);
              },
              text: LocaleKeys.sign_in_terms_link.tr(),
              style: GoogleFonts.poppins(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
