import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialSignInButton extends StatelessWidget {
  const SocialSignInButton({
    Key? key,
    this.margin,
    this.padding,
    required this.text,
    required this.picture,
    required this.color,
    required this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String text;
  final Widget picture;
  final Color color;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            picture,
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
