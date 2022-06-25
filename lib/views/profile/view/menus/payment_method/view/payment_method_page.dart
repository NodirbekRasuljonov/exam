import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/onboarding/auth/widgets/my_elevated_button.dart';
import 'package:exam/views/profile/view/menus/payment_method/cubit/payment_cubit.dart';
import 'package:exam/views/profile/view/menus/payment_method/state/payment_state.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, state) {
        return Scaffold(
          appBar:
              ProfileAppBar.myAppBar(title: 'Payment Method', context: context),
          body: Container(
            height: context.h,
            width: context.h,
            child: Column(
              children: [
                SizedBox(
                  height: context.h * 0.03,
                ),
                method(
                    context: context,
                    darkIcon: 'assets/svg/profilesvg/payment/creditdark.svg',
                    lightIcon: 'assets/svg/profilesvg/payment/credit.svg',
                    title: 'Credit Card',
                    function: () {}),
                SizedBox(
                  height: context.h * 0.02,
                ),
                method(
                    context: context,
                    darkIcon: 'assets/svg/profilesvg/payment/paypaldark.svg',
                    lightIcon: 'assets/svg/profilesvg/payment/paypal.svg',
                    title: 'Credit Card',
                    function: () {}),
                    SizedBox(height: context.h*0.5,),
                MyElevatedButton.button(
                  context: context,
                  title: 'Add payment',
                  route: () {
                    Navigator.pushNamed(context, '/addpayment');
                  },
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget method(
      {required BuildContext context,
      required String darkIcon,
      required String lightIcon,
      required String title,
      required Function function}) {
    return Container(
      height: context.h * 0.12,
      width: context.h * 0.45,
      decoration: BoxDecoration(
          color: context.watch<MainCubit>().isDark
              ? ColorConst.fieldColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
              color: context.watch<MainCubit>().isDark
                  ? Colors.transparent
                  : ColorConst.greyColor)),
      child: Row(
        children: [
          SizedBox(
            width: context.h * 0.02,
          ),
          context.watch<MainCubit>().isDark
              ? SvgPicture.asset(darkIcon)
              : SvgPicture.asset(lightIcon),
          SizedBox(
            width: context.h * 0.02,
          ),
          Text(
            title,
            style: MyTextStyle.textStyle(
              context: context,
              size: SizeConst.elevatedbuttontextsize,
            ),
          ),
          SizedBox(
            width: context.h * 0.2,
          ),
          Icon(
            Icons.chevron_right_outlined,
            color: ColorConst.greyColor,
          )
        ],
      ),
    ).onClick(() {});
  }
}
