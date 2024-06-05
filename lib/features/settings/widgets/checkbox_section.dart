import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';

import '../cubit/settings_cubit.dart';

class CheckboxSection extends StatelessWidget {
  const CheckboxSection({
    Key? key,
    this.margin,
    required this.name,
    this.description,
    required this.checked,
    required this.onCheck,
  }) : super(key: key);

  final EdgeInsets? margin;
  final String name;
  final String? description;
  final bool checked;
  final VoidCallback onCheck;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onCheck,
            behavior: HitTestBehavior.translucent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(100),
                      splashColor: SebekColors.secondary,
                      onTap: onCheck,
                      child: checked
                          ? SvgPicture.asset('assets/images/checkbox_checked.svg')
                          : SvgPicture.asset('assets/images/checkbox.svg'),
                    );
                  },
                )
              ],
            ),
          ),
          description == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    description!,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: SebekColors.tertiary,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
