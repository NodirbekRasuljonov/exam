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

class ProductDetailPage extends StatelessWidget {
  
  MockData data;

  ProductDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left_outlined,
                color: context.watch<MainCubit>().isDark
                    ? ColorConst.whitetextColor
                    : ColorConst.darkmodeColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.h * 0.02,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: context.watch<MainCubit>().isDark
                        ? ColorConst.whitetextColor
                        : ColorConst.darkmodeColor,
                  ),
                ),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
            height: context.h,
            width: context.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: context.h * 0.210,
                  width: context.h * 0.238,
                  child: SvgPicture.asset(data.imgurl),
                ),
                SizedBox(
                  height: context.h * 0.016,
                ),
                SizedBox(
                  height: context.h * 0.121,
                  width: context.h * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            data.title,
                            style: MyTextStyle.textStyle(
                              context: context,
                              size: SizeConst.splashtextsize,
                            ),
                          ),
                          Text(
                            data.market,
                            style: TextStyle(
                                color: ColorConst.greyColor,
                                fontSize: SizeConst.homeAppBarTitle),
                          ),
                          Text(
                            data.price,
                            style: MyTextStyle.textStyle(
                              context: context,
                              size: SizeConst.welcome,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: context.h * 0.04,
                            width: context.h * 0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: ColorConst.greenColor,
                            ),
                            child: Icon(
                              Icons.remove,
                              color: ColorConst.whitetextColor,
                            ),
                          ).onClick(() {
                            context.read<HomeCubit>().remove();
                          }),
                          widthspace(context),
                          Text(
                            context.watch<HomeCubit>().number.toString(),
                            style: MyTextStyle.textStyle(
                              context: context,
                              size: SizeConst.homeAppBarTitle,
                            ),
                          ),
                          widthspace(context),
                          Container(
                            alignment: Alignment.center,
                            height: context.h * 0.04,
                            width: context.h * 0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: ColorConst.greenColor,
                            ),
                            child: Icon(
                              Icons.add,
                              color: ColorConst.whitetextColor,
                            ),
                          ).onClick(() {
                            context.read<HomeCubit>().add();
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: context.h * 0.54,
                  width: context.h * 0.5,
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: MyTextStyle.textStyle(
                          context: context,
                          size: SizeConst.homeAppBarTitle,
                        ),
                      ),
                      Text(data.detail,style: TextStyle(color: ColorConst.greyColor,),textAlign: TextAlign.center,),
                    ],
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


  SizedBox widthspace(BuildContext context) => SizedBox(
        width: context.h * 0.02,
      );
}
