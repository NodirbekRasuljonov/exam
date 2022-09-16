import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/views/home/cubit/home_cubit.dart';
import 'package:exam/views/home/state/home_state.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/extensions/click_extension.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar:
              ProfileAppBar.myAppBar(title: 'Your Coupon', context: context),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
            height: context.h,
            width: context.h,
            child: Column(
              children: [
                space(context),
                coupon(
                  context: context,
                  title: '15% Discount all item',
                  expriy: '7 days remaining',
                ),
                space(context),
                coupon(
                  context: context,
                  title: 'Free Shipping',
                  expriy: '7 days remaining',
                ),
                space(context),
                coupon(
                  context: context,
                  title: '10 % Discount all item',
                  expriy: '7 days remaining',
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  SizedBox space(BuildContext context) => SizedBox(
        height: context.h * 0.02,
      );

  Widget coupon({
    required BuildContext context,
    required String title,
    required String expriy,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: context.watch<MainCubit>().isDark
            ? ColorConst.greenColor.withOpacity(0.15)
            : ColorConst.couponColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: context.h * 0.091,
      width: context.h * 0.51,
      child: Row(
        children: [
          SizedBox(
            width: context.h * 0.02,
          ),
          SvgPicture.asset('assets/svg/home/coupon.svg'),
          SizedBox(
            width: context.h * 0.02,
          ),
          SizedBox(
            width: context.h * 0.33,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: MyTextStyle.textStyle(
                        context: context,
                        size: SizeConst.elevatedbuttontextsize,
                      ),
                    ),
                    Text(
                      expriy,
                      style: TextStyle(
                        color: ColorConst.greyColor,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  color: ColorConst.greyColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
