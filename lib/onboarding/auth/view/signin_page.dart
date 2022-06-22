import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/onboarding/auth/cubit/auth-cubit.dart';
import 'package:exam/onboarding/auth/state/auth_state.dart';
import 'package:exam/onboarding/auth/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: body(context),
        );
      },
      listener: (context, state) {},
    );
  }

  SingleChildScrollView body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: context.h,
        width: context.h,
        child: Stack(
          children: [
            Positioned(
              top: context.h * 0.046,
              left: context.h * 0.032,
              right: context.h * 0.032,
              child: context.watch<MainCubit>().isDark
                  ? SvgPicture.asset('assets/svg/welcomedark.svg')
                  : SvgPicture.asset('assets/svg/welcome.svg'),
            ),
            Positioned(
              left: context.h * 0.02,
              bottom: context.h * 0.045,
              right: context.h * 0.02,
              child: MyElevatedButton.button(
                  context: context,
                  title: 'Sign In',
                  route: () {
                    Navigator.pushNamed(
                      context,
                      '/signUp',
                    );
                  }),
            ),
            Positioned(
              top: context.h * 0.470,
              bottom: context.h * 0.141,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: context.h * 0.281,
                width: context.h * 0.414,
                // color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: MyTextStyle.textStyle(
                          context: context,
                          size: SizeConst.welcome,
                        ),
                      ),
                      SizedBox(
                        height: context.h * 0.016,
                      ),
                      Text(
                        'Welcome to Organico Mobile Apps. Please fill in the field below to sign in.',
                        style: TextStyle(
                          fontSize: SizeConst.elevatedbuttontextsize,
                          color: ColorConst.greyColor,
                        ),
                      ),
                      SizedBox(
                        height: context.h * 0.032,
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
                      SizedBox(
                        height: context.h * 0.02,
                      ),
                      Container(
                        height: context.h * 0.068,
                        width: context.h * 0.45,
                        decoration: BoxDecoration(
                          color: context.watch<MainCubit>().isDark
                              ? ColorConst.fieldColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(color: ColorConst.greyColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: context.h * 0.068,
                              width: context.h * 0.048,
                              child: SvgPicture.asset('assets/svg/lock.svg'),
                            ),
                            Container(
                              height: context.h * 0.068,
                              width: context.h * 0.3,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                              child: TextFormField(
                                // textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle:
                                      TextStyle(color: ColorConst.greyColor),
                                ),
                              ),
                            ),
                            Container(
                              height: context.h * 0.068,
                              width: context.h * 0.054,
                              alignment: Alignment.center,
                              child: SvgPicture.asset('assets/svg/openeye.svg'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
