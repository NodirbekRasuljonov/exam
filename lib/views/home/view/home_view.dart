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
import 'package:on_click/on_click.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  List<MockData> data = Vegetables.vegetables;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: context.h,
            width: context.h,
            padding: EdgeInsets.symmetric(
                horizontal: context.h * 0.02, vertical: context.h * 0.05),
            child: Column(
              children: [
                topBar(context),
                space(context),
                coupon(context).onClick(() {}),
                space(context),
                categories(context),
                SizedBox(
                  height: context.h * 0.03,
                ),
                products(context),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  SizedBox products(BuildContext context) {
    return SizedBox(
      height: context.h * 0.31,
      width: context.h * 0.5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Selling',
                style: MyTextStyle.textStyle(
                  context: context,
                  size: SizeConst.homeAppBarTitle,
                ),
              ),
              TextButton(
                onPressed: () {
                  debugPrint("Salom");
                },
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: ColorConst.greyColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemExtent: context.h*0.196,
              itemBuilder: (context, index) {
                return productbuilder(context: context, index: index);
              },
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  Widget productbuilder(
      {required BuildContext context, required int index}) {
    List<MockData> data = Vegetables.vegetables;
    return Container(
      padding: EdgeInsets.all(context.h * 0.02),
      margin: EdgeInsets.only(right: context.h*0.02),
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
    ).onClick(() { 
      Navigator.pushNamed(context, '/details');
    });
  }

  SizedBox categories(BuildContext context) {
    return SizedBox(
      height: context.h * 0.215,
      width: context.h * 0.45,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose Category',
                style: MyTextStyle.textStyle(
                  context: context,
                  size: SizeConst.homeAppBarTitle,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: ColorConst.greyColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                List<Categories> data = CategoriesData.catList;
                return Container(
                  height: context.h * 0.100,
                  width: context.h * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: ColorConst.catColor[index]),
                  margin: EdgeInsets.only(right: context.h * 0.016),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: context.h * 0.06,
                        width: context.h * 0.09,
                        child: SvgPicture.asset(data[index].imgurl),
                      ),
                      Text(
                        data[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: context.watch<MainCubit>().isDark
                                ? ColorConst.whitetextColor
                                : ColorConst.darkmodeColor),
                      ),
                    ],
                  ),
                ).onClick(() {
                  Navigator.pushNamed(context, '/cat', arguments: data[index]);
                });
              },
              itemCount: CategoriesData.catList.length,
            ),
          )
        ],
      ),
    );
  }

  SizedBox space(BuildContext context) => SizedBox(height: context.h * 0.01);

  SizedBox topBar(BuildContext context) {
    return SizedBox(
      height: context.h * 0.166,
      width: context.h * 0.45,
      child: Column(
        children: [
          Text(
            'Your Location',
            style: TextStyle(
              color: ColorConst.greyColor,
            ),
          ),
          DropdownButton(
              hint: const Text("Tashkent"),
              items: [
                DropdownMenuItem(
                  value: context.watch<HomeCubit>().tashkent,
                  child: const Text('Tashkent'),
                ),
                DropdownMenuItem(
                  value: context.watch<HomeCubit>().london,
                  child: const Text('London'),
                )
              ],
              onChanged: (v) {
                context.read<HomeCubit>().changeLocation(value: v, v: [
                  context.watch<HomeCubit>().tashkent,
                  context.watch<HomeCubit>().london
                ]);
              }),
          SizedBox(
            height: context.h * 0.02,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
            height: context.h * 0.05,
            width: context.h * 0.374,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: context.watch<MainCubit>().isDark
                  ? ColorConst.fieldColor
                  : ColorConst.searchColor,
            ),
            child: Row(children: [
              Icon(
                Icons.search_outlined,
                color: ColorConst.greyColor,
              ),
              SizedBox(
                width: context.h * 0.01,
              ),
              Text(
                'Search anything here',
                style: TextStyle(
                  color: ColorConst.greyColor,
                  fontSize: SizeConst.elevatedbuttontextsize,
                ),
              )
            ]),
          ).onClick(() {
            debugPrint("Search Page");
          })
        ],
      ),
    );
  }

  Widget coupon(BuildContext context) {
    return SizedBox(
      height: context.h * 0.08,
      width: context.h * 0.5,
      child: Row(
        children: [
          SizedBox(
            width: context.h * 0.02,
          ),
          context.watch<MainCubit>().isDark
              ? SvgPicture.asset('assets/svg/home/coupondark.svg')
              : SvgPicture.asset('assets/svg/home/coupon.svg'),
          SizedBox(
            width: context.h * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have 3 coupon',
                style: MyTextStyle.textStyle(
                  context: context,
                  size: SizeConst.elevatedbuttontextsize,
                ),
              ),
              SizedBox(
                height: context.h * 0.005,
              ),
              Text("Let's use this coupon",
                  style: TextStyle(color: ColorConst.greyColor)),
            ],
          ),
          SizedBox(
            width: context.h * 0.16,
          ),
          Icon(
            Icons.chevron_right_outlined,
            color: ColorConst.greyColor,
          )
        ],
      ),
    ).onClick(() {
      Navigator.pushNamed(context, '/coupon');
    });
  }
}
