import 'dart:math';

import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/mock/mock_data.dart';
import 'package:exam/views/home/cubit/home_cubit.dart';
import 'package:exam/views/home/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/extensions/click_extension.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key, required Categories cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              'Vegetables',
              style: MyTextStyle.textStyle(
                context: context,
                size: SizeConst.homeAppBarTitle,
              ),
            ),
            actions: [
              Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.h * 0.02,
                      ),
                      child: context.watch<MainCubit>().isDark
                          ? SvgPicture.asset(
                              'assets/svg/explore/filterdark.svg')
                          : SvgPicture.asset('assets/svg/explore/filter.svg'))
                  .onClick(
                () {
                  debugPrint("Filter");
                },
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
            height: context.h,
            width: context.h,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: context.h * 0.26,
                  mainAxisSpacing: context.h * 0.02,
                  crossAxisSpacing: context.h * 0.02,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return productbuilder(context: context, index: index);
              },
              itemCount: Vegetables.vegetables.length,
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Container productbuilder(
      {required BuildContext context, required int index}) {
    List<MockData> data = Vegetables.vegetables;
    return Container(
      padding: EdgeInsets.all(context.h * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: ColorConst.catColor[Random().nextInt(3)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.h * 0.08,
            width: context.h * 0.1,
            child: SvgPicture.asset(data[index].imgurl),
          ),
          SizedBox(
            height: context.h * 0.02,
          ),
          Text(
            data[index].title,
            style: MyTextStyle.textStyle(
                context: context, size: SizeConst.homeAppBarTitle),
          ),
          SizedBox(
            height: context.h * 0.005,
          ),
          Text(
            data[index].market,
            style: TextStyle(
                color: ColorConst.greyColor,
                fontSize: SizeConst.elevatedbuttontextsize),
          ),
          SizedBox(height: context.h * 0.01),
          Text(
            data[index].price,
            style: MyTextStyle.textStyle(
                context: context, size: SizeConst.homeAppBarTitle),
          )
        ],
      ),
    );
  }
}
