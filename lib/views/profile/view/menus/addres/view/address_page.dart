import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/onboarding/auth/widgets/my_elevated_button.dart';
import 'package:exam/views/profile/view/menus/addres/cubit/addres_cubit.dart';
import 'package:exam/views/profile/view/menus/addres/state/addres_state.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_click/on_click.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddresState>(
      builder: (context, state) {
        return Scaffold(
          appBar: ProfileAppBar.myAppBar(title: 'My Addres', context: context),
          body: Container(
            height: context.h,
            width: context.h,
            padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
            // color: Colors.red,
            child: Column(
              children: [
                SizedBox(
                  height: context.h * 0.02,
                ),
                address(
                    context: context,
                    title: 'Home',
                    desc: '3517 W. Gray St. Utica, Pennsylvania 57867',
                    function: () {}),
                SizedBox(
                  height: context.h * 0.02,
                ),
                address(
                  context: context,
                  title: 'Work',
                  desc: '2715 Ash Dr. San Jose, South Dakota 83475',
                  function: () {},
                ),
                SizedBox(
                  height: context.h*0.5,
                ),
                MyElevatedButton.button(
                  context: context,
                  title: "Add address",
                  route: () {},
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget address(
      {required BuildContext context,
      required String title,
      required String desc,
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
                : ColorConst.greyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MyTextStyle.textStyle(
                  context: context,
                  size: SizeConst.homeAppBarTitle,
                ),
              ),
              SizedBox(
                height: context.h * 0.01,
              ),
              Text(
                desc,
                style: TextStyle(color: ColorConst.greyColor),
              )
            ],
          ),
          Icon(
            Icons.chevron_right_outlined,
            color: ColorConst.greyColor,
            size: 33.0,
          )
        ],
      ),
    ).onClick(() {
      function();
    });
  }
}
