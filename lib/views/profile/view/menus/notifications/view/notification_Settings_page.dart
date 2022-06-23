import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/views/profile/cubit/profile_cubit.dart';
import 'package:exam/views/profile/state/profile_state.dart';
import 'package:exam/views/profile/view/menus/notifications/cubit/notification_cubit.dart';
import 'package:exam/views/profile/view/menus/notifications/state/notification_state.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificatoinState>(
      builder: (context, state) {
        return Scaffold(
          appBar: settingsAppBar(context),
          body: Container(
            height: context.h,
            width: context.h,
            child: Column(
              children: [
                SizedBox(
                  height: context.h * 0.02,
                ),
                listTile(
                    title: 'In App Notification',
                    value: context.watch<NotificationCubit>().inAppNot,
                    context: context),
                listTile(
                    title: 'New Promo',
                    value: context.watch<NotificationCubit>().newPromo,
                    context: context),
                listTile(
                    title: 'Tips & trick',
                    value: context.watch<NotificationCubit>().tips,
                    context: context),
                listTile(
                    title: 'Update Application',
                    value: context.watch<NotificationCubit>().update,
                    context: context),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  SwitchListTile listTile(
      {required String title,
      required bool value,
      required BuildContext context}) {
    return SwitchListTile(
      inactiveThumbColor:context.watch<MainCubit>().isDark?ColorConst.whitetextColor: ColorConst.fieldColor.withOpacity(0.8),
      activeColor: ColorConst.greenColor,
      inactiveTrackColor: context.watch<MainCubit>().isDark
          ? ColorConst.fieldColor
          : ColorConst.fieldColor.withOpacity(0.1),
      activeTrackColor: ColorConst.greenColor.withOpacity(0.2),
      title: Text(
        title,
        style: MyTextStyle.textStyle(
          context: context,
          size: SizeConst.elevatedbuttontextsize,
        ),
      ),
      value: value,
      onChanged: (v) {
        BlocProvider.of<NotificationCubit>(context, listen: false)
            .changeTile(v: v, value: value, title: title);
      },
    );
  }

  AppBar settingsAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left_outlined,
          color: context.watch<MainCubit>().isDark
              ? ColorConst.whitetextColor
              : ColorConst.darkmodeColor,
        ),
      ),
      title: Text(
        'Notification Settings',
        style: MyTextStyle.textStyle(
          context: context,
          size: SizeConst.homeAppBarTitle,
        ),
      ),
    );
  }
}
