import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/onboarding/auth/cubit/auth-cubit.dart';
import 'package:exam/onboarding/auth/state/auth_state.dart';
import 'package:exam/onboarding/auth/widgets/auth_appbar.dart';
import 'package:exam/onboarding/auth/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar:
              AuthAppBar.myAppBar(title: 'Reset Password', context: context),
          body: SizedBox(
            height: context.h,
            width: context.h,
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: context.h * 0.02,
                  ),
                  SizedBox(
                    height: context.h * 0.08,
                    width: context.h * 0.45,
                    child: Text(
                      'Please fill in the field below to reset your current password.',
                      style: TextStyle(
                          fontSize: SizeConst.elevatedbuttontextsize,
                          color: ColorConst.greyColor),
                    ),
                  ),
                  forms(
                      context: context,
                      title: 'New Password',
                      hint: 'New Password'),
                  SizedBox(
                    height: context.h * 0.01,
                  ),
                  forms(
                      context: context,
                      title: 'New Password Confirmation',
                      hint: 'New Password Confirmation'),
                  SizedBox(
                    height: context.h * 0.04,
                  ),
                  MyElevatedButton.button(
                    context: context,
                    title: 'Reset Password',
                    route: () {
                      debugPrint("AUTH page finished");
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  SizedBox forms(
      {required BuildContext context,
      required String title,
      required String hint}) {
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
              color: context.watch<MainCubit>().isDark
                  ? ColorConst.greyColor
                  : ColorConst.darkmodeColor,
              fontSize: SizeConst.elevatedbuttontextsize,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            obscureText:
                title == 'New Password' || title == 'Password Confirmation'
                    ? true
                    : false,
            decoration: InputDecoration(
              fillColor: context.watch<MainCubit>().isDark
                  ? ColorConst.fieldColor
                  : Colors.transparent,
              filled: true,
              suffixIcon:
                  title == 'New Password' || title == 'Password Confirmation'
                      ? Container(
                          height: context.h * 0.042,
                          width: context.h * 0.048,
                          alignment: Alignment.center,
                          child: SvgPicture.asset('assets/svg/openeye.svg'),
                        ).onClick(() {
                          debugPrint("Secure");
                        })
                      : SizedBox(
                          height: context.h * 0.048,
                          width: context.h * 0.045,
                        ),
              hintText: hint,
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
        ],
      ),
    );
  }
}
