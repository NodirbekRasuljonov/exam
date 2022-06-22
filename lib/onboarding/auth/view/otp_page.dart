import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/onboarding/auth/cubit/auth-cubit.dart';
import 'package:exam/onboarding/auth/state/auth_state.dart';
import 'package:exam/onboarding/auth/widgets/auth_appbar.dart';
import 'package:exam/onboarding/auth/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_click/on_click.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AuthAppBar.myAppBar(title: 'OTAC Number', context: context),
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
                  'Enter Authorization Code',
                  style: MyTextStyle.textStyle(
                      context: context, size: SizeConst.welcome),
                ),
                SizedBox(
                  height: context.h * 0.02,
                ),
                SizedBox(
                  height: context.h * 0.06,
                  width: context.h * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'We have sent SMS to:',
                        style: TextStyle(
                            color: ColorConst.greyColor,
                            fontSize: SizeConst.elevatedbuttontextsize),
                      ),
                      Text(
                        '+998(93)XXX-XX-XX',
                        style: MyTextStyle.textStyle(
                          context: context,
                          size: SizeConst.elevatedbuttontextsize,
                        ),
                      ),
                    ],
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
                    title: 'Next',
                    route: () {
                      Navigator.pushNamed(context, '/respass');
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
