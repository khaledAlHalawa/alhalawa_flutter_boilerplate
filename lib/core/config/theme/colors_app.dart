import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      50: Color(0xffeeeaf1),
      100: Color(0xffc9bfd3),
      200: Color(0xffafa0bd),
      300: Color(0xff8a749f),
      400: Color(0xff74598d),
      500: Color(_primaryPrimaryValue),
      600: Color(0xff4a2c66),
      700: Color(0xff3a2250),
      800: Color(0xff2d1a3e),
      900: Color(0xff22142f),
    },
  );

  static const int _primaryPrimaryValue = 0xff513070;

  static const MaterialColor dark = MaterialColor(
    _darkPrimaryValue,
    <int, Color>{
      50: Color(0xffebebeb),
      100: Color(0xffc0c0c0),
      200: Color(0xffa1a1a1),
      300: Color(0xff767676),
      400: Color(0xff5c5c5c),
      500: Color(_darkPrimaryValue),
      600: Color(0xff2e2e2e),
      700: Color(0xff242424),
      800: Color(0xff1c1c1c),
      900: Color(0xff151515),
    },
  );

  static const int _darkPrimaryValue = 0xff333333;

  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      50: Color(0xfff2f1f2),
      100: Color(0xffd6d5d6),
      200: Color(0xffc2c0c2),
      300: Color(0xffa6a3a6),
      400: Color(0xff959195),
      500: Color(_greyPrimaryValue),
      600: Color(0xff6f6b6f),
      700: Color(0xff575457),
      800: Color(0xff434143),
      900: Color(0xff333233),
    },
  );

  static const int _greyPrimaryValue = 0xff7a767a;
}


Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
