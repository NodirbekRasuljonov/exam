import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/views/profile/view/menus/orders/cubit/orders_subit.dart';
import 'package:exam/views/profile/view/menus/orders/state/orders_state.dart';
import 'package:exam/views/profile/view/menus/orders/view/ongoind_page.dart';
import 'package:exam/views/profile/view/menus/orders/view/order_history_page.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_click/on_click.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar.myAppBar(title: 'My Orders', context: context),
      body: SizedBox(
        height: context.h,
        width: context.h,
        child: Column(
          children: [
            SizedBox(
              height: context.h * 0.05,
              width: context.h * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tabs(context: context, title: 'Ongoing', index: 0),
                  tabs(context: context, title: 'History', index: 1),
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  if (state is OrdersOngoingState) {
                    return const OngoinPage();
                  } else if (state is OrdersHistoryState) {
                    return OrderHistoryPage();
                  } else {
                    return Container();
                  }
                },
                listener: (context, state) {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tabs(
      {required BuildContext context,
      required String title,
      required int index}) {
    return Container(
      width: context.h * 0.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 2.5,
              color: context.watch<OrdersCubit>().currentindex == index
                  ? ColorConst.greenColor
                  : Colors.transparent),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: SizeConst.elevatedbuttontextsize,
            color: context.watch<OrdersCubit>().currentindex == index
                ? ColorConst.greenColor
                : ColorConst.greyColor),
      ),
    ).onClick(() {
      context.read<OrdersCubit>().changeTabs(index: index);
    });
  }
}
