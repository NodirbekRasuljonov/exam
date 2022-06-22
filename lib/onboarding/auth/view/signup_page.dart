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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class SignUpaPage extends StatelessWidget {
  const SignUpaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AuthAppBar.myAppBar(
              leading: 'New Registration', context: context),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: context.h,
            width: context.h,
            child: Stack(
              children: [
                Positioned(
                  top: context.h * 0.048,
                  child: Container(
                    height: context.h * 0.08,
                    width: context.h * 0.45,
                    child: Text(
                      "It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
                      style: TextStyle(
                          fontSize: SizeConst.elevatedbuttontextsize,
                          color: ColorConst.greyColor),
                    ),
                  ),
                ),
                Positioned(
                  top: context.h * 0.146,
                  bottom: context.h * 0.3,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        forms(
                            context: context,
                            title: 'Full Name',
                            hint: 'Full Name'),
                        forms(
                            context: context,
                            title: 'Password',
                            hint: 'Password'),
                        forms(
                            context: context,
                            title: 'Password Confirmation',
                            hint: 'Password Confirmation'),
                        SizedBox(
                          height: context.h * 0.05,
                          width: context.h * 0.45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                side: BorderSide(
                                  color: ColorConst.greyColor
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                splashRadius: 10,
                                value: context.watch<AuthCubit>().agreeTerms,
                                onChanged: (v) {
                                  context.read<AuthCubit>().checkBox(v: v);
                                },
                              ),
                              Text(
                                'I accept the',
                                style: MyTextStyle.textStyle(
                                  context: context,
                                  size: 14,
                                ),
                              ),
                              space(),
                              Text(
                                'Terms of Use',
                                style: TextStyle(
                                  color: ColorConst.greenColor,
                                  fontSize: 14,
                                ),
                              ),
                              space(),
                              Text(
                                'and',
                                style: MyTextStyle.textStyle(
                                    context: context, size: 14),
                              ),
                              space(),
                              Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    color: ColorConst.greenColor, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: context.h * 0.05,
                  child: SizedBox(
                    height: context.h * 0.25,
                    width: context.h * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyElevatedButton.button(
                          context: context,
                          title: 'Sign Up',
                          route: () {
                            Navigator.pushNamed(context, '/forgotpass');
                          },
                        ),
                        Text(
                          'or use',
                          style: TextStyle(
                              color: ColorConst.greyColor, fontSize: 16.0),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorConst.greyColor),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            fixedSize: Size(context.h * 0.45, context.h * 0.06),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Sign Up with Google",
                            style: MyTextStyle.textStyle(
                                context: context,
                                size: SizeConst.elevatedbuttontextsize),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  SizedBox space() => const SizedBox(
        width: 3.0,
      );

  SizedBox forms(
      {required BuildContext context,
      required String title,
      required String hint}) {
    return SizedBox(
      height: context.h * 0.1,
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
          Container(
            height: context.h * 0.05,
            width: context.h * 0.45,
            alignment: Alignment.center,
            child: TextFormField(
              obscureText:
                  title == 'Password' || title == 'Password Confirmation'
                      ? true
                      : false,
              decoration: InputDecoration(
                fillColor: context.watch<MainCubit>().isDark?ColorConst.fieldColor:Colors.transparent,
                filled: true,
                suffixIcon:
                    title == 'Password' || title == 'Password Confirmation'
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
          )
        ],
      ),
    );
  }
}
