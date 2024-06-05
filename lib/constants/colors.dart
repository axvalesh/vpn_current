import 'package:flutter/widgets.dart';

class SebekColors {
  static Color primary = const Color(0xff1E2142);
  static Color secondary = const Color(0xff2B2E56);
  static Color tertiary = const Color(0xff797BA4);
  static Color active = const Color(0xff16193A);
  static Color accent = const Color(0xff96E8CA);
  static Color white = const Color(0xffffffff);
  static Color pink = const Color(0xffFE4E98);
  static Color orange = const Color(0xffFCB853);
  static Color black = const Color(0xff000000);
  static Color black2 = const Color(0xff222222);

  static LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      SebekColors.accent.withOpacity(.2),
      SebekColors.accent.withOpacity(.04),
    ],
  );
}