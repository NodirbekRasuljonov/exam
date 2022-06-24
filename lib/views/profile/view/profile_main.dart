import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/views/profile/cubit/profile_cubit.dart';
import 'package:exam/views/profile/state/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(context),
          body: SingleChildScrollView(
            child: SizedBox(
              height: context.h * 0.9,
              width: context.h,
              child: Column(
                children: [
                  bigSpace(context),
                  profileMenu(context),
                  SizedBox(
                    height: context.h * 0.03,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          menu(
                              title: 'Edit Profile',
                              darkIcon: 'assets/svg/profilesvg/profiledark.svg',
                              lightIcon:
                                  'assets/svg/profilesvg/profilelight.svg',
                              function: () {
                                Navigator.pushNamed(context, '/editprofile');
                              },
                              context: context),
                          menu(
                              title: 'My Orders',
                              darkIcon: 'assets/svg/profilesvg/ordersdark.svg',
                              lightIcon:
                                  'assets/svg/profilesvg/orderslight.svg',
                              function: () {
                                Navigator.pushNamed(context, '/orders');
                              },
                              context: context),
                          menu(
                              title: 'My Wishlist',
                              darkIcon:
                                  'assets/svg/profilesvg/wishlistdark.svg',
                              lightIcon:
                                  'assets/svg/profilesvg/wishlistlight.svg',
                              function: () {},
                              context: context),
                          ListTile(
                            onTap: (){
                              debugPrint("Addres");
                              Navigator.pushNamed(context, '/address');
                            },
                            title: Text(
                              'My Addres',
                              style: TextStyle(
                                color: context.watch<MainCubit>().isDark
                                    ? ColorConst.whitetextColor
                                    : ColorConst.darkmodeColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: context.watch<MainCubit>().isDark
                                ? Image.asset(
                                    'assets/svg/profilesvg/addresdark.png')
                                : Image.asset(
                                    'assets/svg/profilesvg/addreslight.png'),
                            trailing: Icon(
                              Icons.chevron_right_outlined,
                              color: ColorConst.greyColor,
                            ),
                          ),
                          menu(
                              title: 'Payment Method',
                              darkIcon: 'assets/svg/profilesvg/paymentdark.svg',
                              lightIcon:
                                  'assets/svg/profilesvg/paymentlight.svg',
                              function: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              context: context),
                          menu(
                              title: 'Customer Service',
                              darkIcon:
                                  'assets/svg/profilesvg/customerdark.svg',
                              lightIcon:
                                  'assets/svg/profilesvg/customerlight.svg',
                              function: () {},
                              context: context),
                          menu(
                              title: 'Change Password',
                              darkIcon:
                                  'assets/svg/profilesvg/passworddark.svg',
                              lightIcon:
                                  'assets/svg/profilesvg/passwordlight.svg',
                              function: () {
                                Navigator.pushNamed(context, '/changepass');
                              },
                              context: context),
                          menu(
                              title: 'Logout',
                              darkIcon: 'assets/svg/profilesvg/logdark.svg',
                              lightIcon: 'assets/svg/profilesvg/loglight.svg',
                              function: () {},
                              context: context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  ListTile menu(
      {required String title,
      required String lightIcon,
      required String darkIcon,
      required Function function,
      required BuildContext context}) {
    return ListTile(
      onTap: () {
        function();
      },
      title: Text(
        title,
        style: TextStyle(
          color: context.watch<MainCubit>().isDark
              ? ColorConst.whitetextColor
              : ColorConst.darkmodeColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: context.watch<MainCubit>().isDark
          ? SvgPicture.asset(darkIcon)
          : SvgPicture.asset(lightIcon),
      trailing: Icon(
        Icons.chevron_right_outlined,
        color: ColorConst.greyColor,
      ),
    );
  }

  SizedBox profileMenu(BuildContext context) {
    return SizedBox(
      height: context.h * 0.25,
      width: context.h * 0.171,
      child: Column(
        children: [
          Container(
            height: context.h * 0.171,
            width: context.h * 0.171,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: context.h * 0.02,
          ),
          Text(
            'Jane Doe',
            style: MyTextStyle.textStyle(
              context: context,
              size: SizeConst.homeAppBarTitle,
            ),
          ),
          Text(
            '(307) 555-0133',
            style: TextStyle(
              color: ColorConst.greyColor,
              fontSize: SizeConst.homeAppBarTitle,
            ),
          )
        ],
      ),
    );
  }

  SizedBox bigSpace(BuildContext context) => SizedBox(
        height: context.h * 0.02,
      );

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(
        'Profile',
        style: MyTextStyle.textStyle(
          context: context,
          size: SizeConst.homeAppBarTitle,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: context.h * 0.024,
          width: context.h * 0.024,
          child: context.watch<MainCubit>().isDark
              ? SvgPicture.asset('assets/svg/profilesvg/darknot.svg')
              : SvgPicture.asset('assets/svg/profilesvg/lightnot.svg'),
        ).onClick(
          () {
            debugPrint("Notification");
            Navigator.pushNamed(context, '/notification');
          },
        )
      ],
    );
  }
}
