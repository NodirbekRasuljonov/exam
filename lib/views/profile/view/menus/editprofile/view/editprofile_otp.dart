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
import 'package:on_click/on_click.dart';

class EditProfileOTP extends StatelessWidget {
  const EditProfileOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: ProfileAppBar.myAppBar(title: 'OTAC number', context: context),
          body: Container(
            padding: EdgeInsets.symmetric(
              vertical: context.h * 0.02,
              horizontal: context.h * 0.02,
            ),
            height: context.h,
            width: context.h,
            child: Column(
              children: [
                Text(
                  'It looks like you changed your phone number. Please enter the OTAC number that we have sent to your new phone number.',
                  style: TextStyle(
                    color: ColorConst.greyColor,
                    fontSize: SizeConst.elevatedbuttontextsize,
                  ),
                ),
                space(context),
                Container(
                  height: context.h * 0.058,
                  width: context.h * 0.45,
                  decoration: BoxDecoration(
                    color: context.watch<MainCubit>().isDark
                        ? ColorConst.fieldColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: ColorConst.greyColor),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '     6 Digit Code',
                      hintStyle: TextStyle(
                          color: ColorConst.greyColor,
                          fontSize: SizeConst.elevatedbuttontextsize),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.h * 0.025,
                ),
                SizedBox(
                    height: context.h * 0.03,
                    width: context.h * 0.45,
                    child: Text(
                      'Resend Code',
                      style: TextStyle(color: ColorConst.greenColor),
                      textAlign: TextAlign.right,
                    ).onClick(() {
                      debugPrint("Resent");
                    })),
                space(context),
                MyElevatedButton.button(
                    context: context,
                    title: 'Confirm',
                    route: () {
                    Navigator.pop(context);
                    })
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  SizedBox space(BuildContext context) {
    return SizedBox(
      height: context.h * 0.04,
    );
  }
}
