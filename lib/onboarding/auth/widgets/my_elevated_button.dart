import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class MyElevatedButton {
  static ElevatedButton button(
      {required BuildContext context,
      required String title,
      required String route}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        fixedSize: Size(context.h * 0.374, context.h * 0.053),
        primary: ColorConst.kprimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        title,
        style: TextStyle(
          color: ColorConst.whitetextColor,
          fontSize: SizeConst.elevatedbuttontextsize,
        ),
      ),
    );
  }
}
