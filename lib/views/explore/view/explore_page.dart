import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/mock/mock_data.dart';
import 'package:exam/views/explore/cubit/explore_cubit.dart';
import 'package:exam/views/explore/state/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              'Explore',
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
                    ? SvgPicture.asset('assets/svg/explore/filterdark.svg')
                    : SvgPicture.asset('assets/svg/explore/filter.svg')
              ).onClick(
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
          color: Color(0xffE3553F).withOpacity(0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(data[index].imgurl),
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
