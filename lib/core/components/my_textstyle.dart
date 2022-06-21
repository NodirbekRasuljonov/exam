import 'package:exam/core/constants/color_const.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTextStyle{
  static TextStyle textStyle({required BuildContext context,required double size}){
    return TextStyle(
      fontSize: size,
      color: context.watch<MainCubit>().isDark?ColorConst.whitetextColor:ColorConst.darkmodeColor

    );
  }
}