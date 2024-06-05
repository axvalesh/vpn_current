import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';

import '../enums/enums.dart';

class SegmentedControlSegment extends StatelessWidget {
  const SegmentedControlSegment({
    Key? key,
    required this.pageState,
    required this.serverType,
    required this.text,
  }) : super(key: key);

  final ServerType pageState;
  final ServerType serverType;
  final String text;

  TextStyle _selectorTextStyle(ServerType sectionType) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color:
          sectionType == pageState ? SebekColors.white : SebekColors.tertiary,
      fontSize: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: _selectorTextStyle(serverType),
      ),
    );
  }
}
