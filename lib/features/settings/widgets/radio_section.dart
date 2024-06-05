import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/features/settings/cubit/settings_cubit.dart';

import 'widgets.dart';

class RadioSection extends StatelessWidget {
  const RadioSection({
    Key? key,
    this.margin,
    required this.name,
    required this.description,
    required this.enumOptions,
    required this.selectedOption, required this.onTap,
  }) : super(key: key);

  final EdgeInsets? margin;
  final String name;
  final String description;
  final List<Enum> enumOptions;
  final Enum selectedOption;
  final Function(Enum option) onTap;

  List<Widget> _optionsRows(BuildContext context) {
    return enumOptions.map((option) {
      return RadioRow(
        margin: const EdgeInsets.only(top: 16.0),
        selectedOption: selectedOption,
        option: option,
        onTap: () => onTap(option),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: SebekColors.tertiary,
              ),
            ),
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                children: _optionsRows(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
