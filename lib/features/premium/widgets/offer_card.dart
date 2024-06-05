import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    this.margin,
    required this.name,
    required this.description,
    required this.price,
    this.renewalFrequency,
    this.onTap,
  }) : super(key: key);

  final EdgeInsets? margin;
  final String name;
  final String description;
  final String price;
  final String? renewalFrequency;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        borderRadius: BorderRadius.circular(24),
        color: SebekColors.secondary,
        child: InkWell(
          splashColor: SebekColors.primary,
          hoverColor: SebekColors.primary,
          highlightColor: SebekColors.primary,
          focusColor: SebekColors.primary,
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: SebekColors.white,
                      ),
                    ),
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: SebekColors.tertiary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: SebekColors.accent,
                      ),
                    ),
                    renewalFrequency != null ? Text(
                      renewalFrequency!,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: SebekColors.accent,
                      ),
                    ) : SizedBox(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
