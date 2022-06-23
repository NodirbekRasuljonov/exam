import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/views/profile/view/menus/notifications/cubit/notification_cubit.dart';
import 'package:exam/views/profile/view/menus/notifications/state/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificatoinState>(
      builder: (context, state) {
        return Scaffold(
          appBar: notificationAppbar(context),
          body: body(context),
        );
      },
      listener: (context, state) {},
    );
  }

  SizedBox body(BuildContext context) {
    return SizedBox(
      height: context.h,
      width: context.h,
      child: Column(
        children: [
          notifications(
              context: context,
              darkIcon: 'assets/svg/profilesvg/notificationicons/cardark.svg',
              lightIcon: 'assets/svg/profilesvg/notificationicons/car.svg',
              title: 'Order Status',
              desc:
                  'Congratulations, your order has been sent. You can check here.',
              date: '25 Feb 2021 06:15 AM'),
          notifications(
            context: context,
            title: 'New Promo',
            desc: '15% discount for all purchases above  Check it now.',
            date: '25 Feb 2021 05:00 AM',
            darkIcon: 'assets/svg/profilesvg/notificationicons/promodark.svg',
            lightIcon: 'assets/svg/profilesvg/notificationicons/promo.svg',
          ),
          notifications(
            context: context,
            title: 'Tips',
            desc: 'Let’s learn how to maximize the use of vouchers in the application.',
            date: '25 Feb 2021 05:00 AM',
            darkIcon: 'assets/svg/profilesvg/notificationicons/maildark.svg',
            lightIcon: 'assets/svg/profilesvg/notificationicons/mail.svg',
          ),

        ],
      ),
    );
  }

  Container notifications(
      {required BuildContext context,
      required String title,
      required String desc,
      required String date,
      required String lightIcon,
      required String darkIcon}) {
    return Container(
      height: context.h * 0.15,
      width: context.h * 0.55,
      color: context.watch<MainCubit>().isDark
          ? Color(0xff2ECC71).withOpacity(0.15)
          : Color(0xffAA0023).withOpacity(0.15),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.watch<MainCubit>().isDark
              ? SvgPicture.asset(darkIcon)
              : SvgPicture.asset(lightIcon),
          SizedBox(
            width: context.h * 0.024,
          ),
          SizedBox(
            height: context.h * 0.12,
            width: context.h * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: MyTextStyle.textStyle(
                    context: context,
                    size: SizeConst.elevatedbuttontextsize,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  desc,
                  style: TextStyle(
                    color: ColorConst.greyColor,
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  date,
                  style: TextStyle(
                    color: ColorConst.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar notificationAppbar(BuildContext context) {
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
        'Notification',
        style: TextStyle(
          color: context.watch<MainCubit>().isDark
              ? ColorConst.whitetextColor
              : ColorConst.darkmodeColor,
          fontSize: SizeConst.homeAppBarTitle,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            child: context.watch<MainCubit>().isDark
                ? SvgPicture.asset('assets/svg/profilesvg/settingsdark.svg')
                : SvgPicture.asset('assets/svg/profilesvg/settingslight.svg'),
          ).onClick(
            () {
              Navigator.pushNamed(context, '/notificationsettings');
            },
          ),
        ),
      ],
    );
  }
}
