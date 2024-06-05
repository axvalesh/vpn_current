import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';

class SebekMenuCard extends StatelessWidget {
  const SebekMenuCard({Key? key, this.margin, required this.leading, required this.text, this.onTap})
      : super(key: key);

  final EdgeInsets? margin;
  final Widget leading;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          // margin: margin,
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: SebekColors.secondary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  leading,
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      text,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                onPressed: onTap,
                child: SvgPicture.asset('assets/images/chevron_right.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
