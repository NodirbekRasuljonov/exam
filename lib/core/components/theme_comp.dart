import 'package:exam/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class ThemeComp {
  static ThemeData lightmode = ThemeData();
  static ThemeData darkmode = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: ColorConst.darkmodeColor
    )
  );
}
