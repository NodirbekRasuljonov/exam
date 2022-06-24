import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/onboarding/auth/widgets/my_elevated_button.dart';
import 'package:exam/views/profile/view/menus/editprofile/cubit/edit_profile_cubit.dart';
import 'package:exam/views/profile/view/menus/editprofile/state/edit_profile_state.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar:
              ProfileAppBar.myAppBar(title: 'Edit Profile', context: context),
          body: body(context),
        );
      },
      listener: (context, state) {},
    );
  }

  Container body(BuildContext context) {
    return Container(
      height: context.h,
      width: context.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.h * 0.024,
            ),
            Container(
              height: context.h * 0.171,
              width: context.h * 0.171,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/profile.jpg',
                  ),
                ),
              ),
              alignment: Alignment.bottomRight,
              child: SizedBox(
                child: context.watch<MainCubit>().isDark
                    ? SvgPicture.asset(
                        'assets/svg/profilesvg/editprofile/cameradark.svg')
                    : SvgPicture.asset(
                        'assets/svg/profilesvg/editprofile/cameralight.svg'),
              ).onClick(() {
                debugPrint("salom");
              }),
            ),
            forms(
              context: context,
              title: 'Name',
            ),
            SizedBox(
              height: context.h * 0.12,
              width: context.h * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: context.watch<MainCubit>().isDark
                          ? ColorConst.greyColor
                          : ColorConst.darkmodeColor,
                      fontSize: SizeConst.elevatedbuttontextsize,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: context.h * 0.07,
                    width: context.h * 0.45,
                    decoration: BoxDecoration(
                        color: context.watch<MainCubit>().isDark
                            ? ColorConst.fieldColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(color: ColorConst.greyColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: context.h * 0.048,
                          width: context.h * 0.048,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: ColorConst.greyColor,
                              ),
                            ),
                          ),
                          child: SvgPicture.asset('assets/svg/lock.svg'),
                        ),
                        Container(
                          height: context.h * 0.048,
                          width: context.h * 0.38,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            // textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your Phone number',
                              hintStyle: TextStyle(color: ColorConst.greyColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.h * 0.2,
              width: context.h * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Addres',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: context.watch<MainCubit>().isDark
                          ? ColorConst.greyColor
                          : ColorConst.darkmodeColor,
                      fontSize: SizeConst.elevatedbuttontextsize,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: context.h * 0.15,
                    width: context.h * 0.45,
                    child: TextFormField(
                      maxLines: 10,
                      textAlign: TextAlign.start,
                      initialValue: '3517 W. Gray St. Utica Pennsylvania 57867',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: context.watch<MainCubit>().isDark
                            ? ColorConst.whitetextColor
                            : ColorConst.darkmodeColor,
                        fontSize: SizeConst.elevatedbuttontextsize,
                      ),
                      decoration: InputDecoration(
                        fillColor: context.watch<MainCubit>().isDark
                            ? ColorConst.fieldColor
                            : Colors.transparent,
                        filled: true,
                        hintStyle: TextStyle(
                          color: ColorConst.greyColor,
                          fontSize: SizeConst.elevatedbuttontextsize,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(
                            color: ColorConst.greyColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(
                            color: ColorConst.greyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(
                            color: ColorConst.greyColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: context.h*0.15,),
            MyElevatedButton.button(context: context, title: 'Save', route: (){
              Navigator.pushNamed(context, '/editprofileotp');
            })
          ],
        ),
      ),
    );
  }

  SizedBox forms({
    required BuildContext context,
    required String title,
  }) {
    return SizedBox(
      height: context.h * 0.12,
      width: context.h * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: context.watch<MainCubit>().isDark
                  ? ColorConst.greyColor
                  : ColorConst.darkmodeColor,
              fontSize: SizeConst.elevatedbuttontextsize,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: context.h * 0.07,
            width: context.h * 0.45,
            alignment: Alignment.topCenter,
            child: TextFormField(
              textAlign: TextAlign.start,
              initialValue: 'Nodirbek Rasuljonov',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: context.watch<MainCubit>().isDark
                    ? ColorConst.whitetextColor
                    : ColorConst.darkmodeColor,
                fontSize: SizeConst.elevatedbuttontextsize,
              ),
              decoration: InputDecoration(
                fillColor: context.watch<MainCubit>().isDark
                    ? ColorConst.fieldColor
                    : Colors.transparent,
                filled: true,
                hintStyle: TextStyle(
                  color: ColorConst.greyColor,
                  fontSize: SizeConst.elevatedbuttontextsize,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: ColorConst.greyColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: ColorConst.greyColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: ColorConst.greyColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
