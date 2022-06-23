import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_click/on_click.dart';

class ProfileAppBar {
  static PreferredSizeWidget myAppBar(
      {required String title,
      required BuildContext context,
      List <Widget>? actions,
      Function? actionsFunction}) {
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: actions! != null
              ? context.watch<MainCubit>().isDark?actions[1].onClick(
                  () {
                    actionsFunction!();
                  },
                ):actions[0].onClick(
                  () {
                    actionsFunction!();
                  },
                )
              : Container(
                  height: context.h * 0.024,
                  width: context.h * 0.024,
                ),
        )
      ],
      leading: Icon(
        Icons.chevron_left_outlined,
        color: context.watch<MainCubit>().isDark
            ? ColorConst.whitetextColor
            : ColorConst.darkmodeColor,
      ).onClick(() {
        Navigator.pop(context);
      }),
      title: Text(title),
      titleTextStyle: MyTextStyle.textStyle(context: context, size: 18),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }
}
