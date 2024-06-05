import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../enums/enums.dart';

class RadioRow extends StatelessWidget {
  const RadioRow({
    Key? key,
    required this.onTap,
    required this.selectedOption,
    required this.option,
    this.margin,
  }) : super(key: key);

  final Enum selectedOption;
  final Enum option;
  final VoidCallback onTap;
  final EdgeInsets? margin;

  String _label(BuildContext context) {
    if (selectedOption.runtimeType == VpnProtocol) {
      return context.tr('settings_page.protocols.${option.name}');
    } else {
      return context.tr('settings_page.connection_timeout.${option.name}');
    }
  }

  bool _selected() {
    return selectedOption == option;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _label(context),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              splashColor: SebekColors.secondary,
              onTap: onTap,
              child: _selected()
                  ? SvgPicture.asset('assets/images/checkbox_active.svg')
                  : SvgPicture.asset('assets/images/checkbox.svg'),
            )
          ],
        ),
      ),
    );
  }
}
