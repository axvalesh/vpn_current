import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/features/settings/enums/enums.dart';

import '../cubit/settings_cubit.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({
    Key? key,
    required this.language,
    this.onTap,
  }) : super(key: key);

  final Language language;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    String label = context.tr('language.${language.name}.label');
    String country = context.tr('language.${language.name}.country');
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              'assets/images/flag_$country.svg',
              height: 30,
              width: 30,
            ),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
