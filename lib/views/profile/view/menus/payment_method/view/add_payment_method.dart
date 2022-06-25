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

class AddPaymnetMethodPage extends StatelessWidget {
  const AddPaymnetMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, state) {
        return Scaffold(
          appBar: ProfileAppBar.myAppBar(
              title: 'Add Payment Method', context: context),
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
      padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.h * 0.02,
          ),
          selectMethod(context),
          SizedBox(
            height: context.h * 0.03,
          ),
          SizedBox(
            height: context.h * 0.45,
            width: context.h * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Details Method',
                    style: TextStyle(
                        fontSize: SizeConst.homeAppBarTitle,
                        fontWeight: FontWeight.w600,
                        color: context.watch<MainCubit>().isDark
                            ? ColorConst.whitetextColor
                            : ColorConst.darkmodeColor)),
                SizedBox(
                  height: context.h * 0.02,
                ),
                forms(context: context, title: 'Name', hint: 'Name'),
                SizedBox(
                  height: context.h * 0.02,
                ),
                forms(
                    context: context,
                    title: 'Credit Card Number',
                    hint: 'Credit Card Number'),
                SizedBox(
                  height: context.h * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    formsmini(context: context, title: 'CCV', hint: 'CCV'),
                    formsmini(
                        context: context, title: 'Experies', hint: 'Experies')
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.h * 0.2,
          ),
          MyElevatedButton.button(
            context: context,
            title: 'Save',
            route: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
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
              color: ColorConst.greyColor,
              fontSize: SizeConst.elevatedbuttontextsize,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              fillColor: context.watch<MainCubit>().isDark
                  ? ColorConst.fieldColor
                  : Colors.transparent,
              filled: true,
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

  SizedBox formsmini(
      {required BuildContext context,
      required String title,
      required String hint}) {
    return SizedBox(
      height: context.h * 0.12,
      width: context.h * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ColorConst.greyColor,
              fontSize: SizeConst.elevatedbuttontextsize,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              fillColor: context.watch<MainCubit>().isDark
                  ? ColorConst.fieldColor
                  : Colors.transparent,
              filled: true,
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

  SizedBox selectMethod(BuildContext context) {
    return SizedBox(
      height: context.h * 0.1,
      width: context.h * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Method',
            style: TextStyle(
              fontSize: SizeConst.homeAppBarTitle,
              fontWeight: FontWeight.w600,
              color: context.watch<MainCubit>().isDark
                  ? ColorConst.texfieldColor
                  : ColorConst.darkmodeColor,
            ),
          ),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    splashRadius: 15.0,
                    hoverColor: context.watch<MainCubit>().isDark
                        ? ColorConst.greenColor
                        : ColorConst.darkmodeColor,
                    focusColor: context.watch<MainCubit>().isDark
                        ? ColorConst.greenColor
                        : ColorConst.darkmodeColor,
                    activeColor: context.watch<MainCubit>().isDark
                        ? ColorConst.greenColor
                        : ColorConst.darkmodeColor,
                    value: context.watch<PaymentMethodCubit>().creditcard,
                    groupValue: context.watch<PaymentMethodCubit>().method,
                    onChanged: (v) {
                      context.read<PaymentMethodCubit>().selectMethod(value: v);
                    },
                  ),
                  Text(
                    'Credit Card',
                    style: MyTextStyle.textStyle(
                      context: context,
                      size: SizeConst.elevatedbuttontextsize,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    splashRadius: 15.0,
                    hoverColor: context.watch<MainCubit>().isDark
                        ? ColorConst.greenColor
                        : ColorConst.darkmodeColor,
                    focusColor: context.watch<MainCubit>().isDark
                        ? ColorConst.greenColor
                        : ColorConst.darkmodeColor,
                    activeColor: context.watch<MainCubit>().isDark
                        ? ColorConst.greenColor
                        : ColorConst.darkmodeColor,
                    value: context.watch<PaymentMethodCubit>().paypal,
                    groupValue: context.watch<PaymentMethodCubit>().method,
                    onChanged: (v) {
                      context.read<PaymentMethodCubit>().selectMethod(value: v);
                    },
                  ),
                  Text(
                    'Paypal',
                    style: MyTextStyle.textStyle(
                      context: context,
                      size: SizeConst.elevatedbuttontextsize,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
