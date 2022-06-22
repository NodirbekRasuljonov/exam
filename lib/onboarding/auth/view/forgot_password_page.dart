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
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AuthAppBar.myAppBar(
            context: context,
            title: 'Forgot Password',
          ),
          body: SizedBox(
            height: context.h,
            width: context.h,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  context.watch<MainCubit>().isDark
                      ? SvgPicture.asset('assets/svg/forgotdark.svg')
                      : SvgPicture.asset('assets/svg/forgotlight.svg'),
                  SizedBox(
                    height: context.h*0.06,
                  ),
                  Container(
                    height: context.h * 0.22,
                    width: context.h * 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your phone number',
                          style: TextStyle(
                            color: context.watch<MainCubit>().isDark
                                ? ColorConst.greyColor
                                : ColorConst.darkmodeColor,
                            fontSize: SizeConst.welcome,
                          ),
                        ),
                        Text(
                          'We need to verify you. We will send you a one-time authorization code.',
                          style: TextStyle(
                            color: ColorConst.greyColor,
                            fontSize: SizeConst.elevatedbuttontextsize,
                          ),
                        ),
                        Container(
                          height: context.h * 0.068,
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
                                height: context.h * 0.068,
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
                                height: context.h * 0.068,
                                width: context.h * 0.38,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  // textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Your Phone number',
                                    hintStyle:
                                        TextStyle(color: ColorConst.greyColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.h*0.05,),
                  MyElevatedButton.button(
                    context: context,
                    title: 'Next',
                    route: () {
                      Navigator.pushNamed(context, '/otp');
                    },
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
}
