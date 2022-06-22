import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class MyElevatedButton {
  static ElevatedButton button(
      {required BuildContext context,
      required String title,
      required Function route}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        fixedSize: Size(context.h * 0.45, context.h * 0.06),
        primary: ColorConst.kprimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      onPressed: () {
        route();
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
