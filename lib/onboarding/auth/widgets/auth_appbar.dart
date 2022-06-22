import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_click/on_click.dart';

class AuthAppBar {
  static PreferredSizeWidget myAppBar(
      {required String leading, required BuildContext context}) {
    return AppBar(
      leading: Icon(
        Icons.chevron_left_outlined,
        color: context.watch<MainCubit>().isDark
            ? ColorConst.whitetextColor
            : ColorConst.darkmodeColor,
      ).onClick(() {
        Navigator.pop(context);
      }),
      title: Text(leading),
      titleTextStyle: MyTextStyle.textStyle(context: context, size: 18),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }
}
