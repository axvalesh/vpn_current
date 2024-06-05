import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';

class StatsBadge extends StatelessWidget {
  const StatsBadge({
    Key? key,
    required this.label,
    required this.data,
    required this.icon,
    this.margin,
  }) : super(key: key);

  final String label;
  final String data;
  final Widget icon;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: SebekColors.secondary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data,
              style:
                  GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: icon,
                  ),
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      color: SebekColors.tertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
