import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';

class BuyPersonalServerRow extends StatefulWidget {
  const BuyPersonalServerRow({
    Key? key,
    required this.title,
    required this.purchasedCount,
    required this.availableCount,
    required this.onCheck,
    required this.active,
  }) : super(key: key);

  final String title;
  final int purchasedCount;
  final int availableCount;
  final VoidCallback onCheck;
  final bool active;

  @override
  State<BuyPersonalServerRow> createState() => _BuyPersonalServerRowState();
}

class _BuyPersonalServerRowState extends State<BuyPersonalServerRow> {
  bool _sold() {
    return widget.availableCount < widget.purchasedCount;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
      child: GestureDetector(
        onTap: _sold() ? null : widget.onCheck,
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: [
            Expanded(
              child: Opacity(
                opacity: _sold() ? .4 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: SebekColors.white,
                      ),
                    ),
                    Text(
                      LocaleKeys.buy_personal_server_page_per_month,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: SebekColors.tertiary,
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${widget.purchasedCount + (widget.active ? 1 : 0)}/${widget.availableCount}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: SebekColors.white.withOpacity(_sold() ? .4: 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  splashColor: SebekColors.secondary,
                  onTap: _sold() ? null : widget.onCheck,
                  child: _sold()
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: SebekColors.pink,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            LocaleKeys.buy_personal_server_page_sold,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ).tr(),
                        )
                      : SvgPicture.asset(
                          'assets/images/checkbox${widget.active ? '_checked' : ''}.svg',
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
