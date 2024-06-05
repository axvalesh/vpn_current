import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/features/settings/cubit/settings_cubit.dart';
import 'package:sebek_vpn/features/settings/enums/enums.dart';

ThemeData sebekTheme(BuildContext context) {
  ThemeData baseTheme = ThemeData.dark(
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: SebekColors.primary,
      onPrimary: SebekColors.white,
      secondary: SebekColors.accent,
      onSecondary: SebekColors.active,
      error: SebekColors.primary,
      onError: SebekColors.pink,
      background: SebekColors.primary,
      onBackground: SebekColors.tertiary,
      surface: SebekColors.secondary,
      onSurface: SebekColors.white,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: SebekColors.accent,
      selectionColor: SebekColors.accent.withOpacity(.25),
      selectionHandleColor: SebekColors.accent,
    ),
    appBarTheme:
        AppBarTheme(centerTitle: true, backgroundColor: SebekColors.primary),
    scaffoldBackgroundColor: SebekColors.primary,
    textTheme: context.read<SettingsCubit>().state.language == Language.uk
        ? GoogleFonts.interTextTheme(baseTheme.textTheme)
        : GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}
