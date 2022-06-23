import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/views/cart/view/cart_page.dart';
import 'package:exam/views/explore/view/explore_page.dart';
import 'package:exam/views/home/cubit/home_cubit.dart';
import 'package:exam/views/home/state/home_state.dart';
import 'package:exam/views/home/view/home_view.dart';
import 'package:exam/views/profile/view/profile_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit,HomeState>(
        builder: (context, state) {
          if(state is HomeInitialState){
            return HomeView();
          }
          else if(state is HomeExploreState){
            return ExplorePage();
          }
          else if(state is HomeCartState){
            return CartPage();
          }
          else{
            return ProfilePage();
          }
        },
        listener: (context, state) {},
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  Container bottomBar(BuildContext context) {
    return Container(
      height: context.h * 0.074,
      width: context.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConst.fieldColor.withOpacity(0.5),
            blurRadius: 0.1,
            spreadRadius: 0.1,
          )
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        color: context.watch<MainCubit>().isDark
            ? ColorConst.fieldColor
            : ColorConst.whitetextColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: bars(lightmodeicons: [
              'assets/svg/bottom/homenotsel.svg',
              'assets/svg/bottom/homesel.svg'
            ], darkmodeicons: [
              'assets/svg/bottom/homenotsel.svg',
              'assets/svg/bottom/homeseldark.svg'
            ], index: 0, context: context),
          ),
          Expanded(
            child: bars(lightmodeicons: [
              'assets/svg/bottom/explorenotsel.svg',
              'assets/svg/bottom/exploresellight.svg'
            ], darkmodeicons: [
              'assets/svg/bottom/explorenotsel.svg',
              'assets/svg/bottom/exploreseldark.svg'
            ], index: 1, context: context),
          ),
          Expanded(
            child: bars(lightmodeicons: [
              'assets/svg/bottom/cartnotsel.svg',
              'assets/svg/bottom/cartsellight.svg'
            ], darkmodeicons: [
              'assets/svg/bottom/cartnotsel.svg',
              'assets/svg/bottom/cartseldark.svg'
            ], index: 2, context: context),
          ),
          Expanded(
            child: bars(lightmodeicons: [
              'assets/svg/bottom/profilenotsellight.svg',
              'assets/svg/bottom/profilesellight.svg'
            ], darkmodeicons: [
              'assets/svg/bottom/profilenotsellight.svg',
              'assets/svg/bottom/profileseldark.svg'
            ], index: 3, context: context),
          ),
        ],
      ),
    );
  }

  Widget bars(
      {required List<String> lightmodeicons,
      required List<String> darkmodeicons,
      required int index,
      required BuildContext context}) {
    return SizedBox(
      child: context.watch<HomeCubit>().currentindex == index
          ? context.watch<MainCubit>().isDark
              ? SvgPicture.asset(darkmodeicons[1])
              : SvgPicture.asset(lightmodeicons[1])
          : context.watch<MainCubit>().isDark
              ? SvgPicture.asset(darkmodeicons[0])
              : SvgPicture.asset(lightmodeicons[0]),
    ).onClick(
      () {
        context.read<HomeCubit>().changetheIndex(index: index);
      },
    );
  }
}
