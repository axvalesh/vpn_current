import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';

class SwitchRow extends StatelessWidget {
  const SwitchRow({
    Key? key,
    this.margin,
    this.enabled = false,
    required this.onToggle,
    required this.label,
  }) : super(key: key);

  final EdgeInsets? margin;
  final bool enabled;
  final void Function(bool?) onToggle;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 15,),
          FlutterSwitch(
            value: enabled,
            onToggle: onToggle,
            activeColor: SebekColors.accent,
            inactiveColor: SebekColors.secondary,
            toggleColor: SebekColors.active,
            toggleSize: 22,
            height: 26,
            width: 50,
            padding: 2,
          ),
        ],
      ),
    );
  }
}
