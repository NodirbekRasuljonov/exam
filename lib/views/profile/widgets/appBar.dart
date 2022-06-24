import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_click/on_click.dart';

class ProfileAppBar {
  static PreferredSizeWidget myAppBar({
    required String title,
    required BuildContext context,
  }) {
    return AppBar(
      leading: Icon(
        Icons.chevron_left_outlined,
        color: context.watch<MainCubit>().isDark
            ? ColorConst.whitetextColor
            : ColorConst.darkmodeColor,
      ).onClick(() {
        Navigator.pop(context);
      }),
      title: Text(title),
      titleTextStyle: TextStyle(
        fontSize: SizeConst.homeAppBarTitle,
        fontWeight: FontWeight.w600,
        color: context.watch<MainCubit>().isDark
            ? ColorConst.whitetextColor
            : ColorConst.darkmodeColor,
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }
}
