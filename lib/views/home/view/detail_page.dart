import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/views/home/cubit/home_cubit.dart';
import 'package:exam/views/home/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

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
                  onPressed: () {
                    
                  },
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
        );
      },
      listener: (context, state) {},
    );
  }
}
