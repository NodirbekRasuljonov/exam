import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/onboarding/auth/widgets/my_elevated_button.dart';
import 'package:exam/views/profile/view/menus/orders/cubit/orders_subit.dart';
import 'package:exam/views/profile/view/menus/orders/state/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OngoinPage extends StatelessWidget {
  const OngoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return Container(
          height: context.h,
          width: context.h,
          padding: EdgeInsets.symmetric(horizontal: context.h * 0.032),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.h * 0.05,
                ),
                context.watch<MainCubit>().isDark
                    ? SvgPicture.asset(
                        'assets/svg/profilesvg/orders/emptydark.svg')
                    : SvgPicture.asset(
                        'assets/svg/profilesvg/orders/empty.svg'),
                SizedBox(
                  height: context.h * 0.03,
                ),
                Text(
                  'There is no ongoing order right now. You can order from home.',
                  style: MyTextStyle.textStyle(
                      context: context, size: SizeConst.homeAppBarTitle),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: context.h * 0.15,
                ),
                MyElevatedButton.button(
                    context: context,
                    title: 'Go home',
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
}
