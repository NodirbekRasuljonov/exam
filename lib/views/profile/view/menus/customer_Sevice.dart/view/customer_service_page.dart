import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/views/profile/view/menus/customer_Sevice.dart/cubit/customer_service_cubit.dart';
import 'package:exam/views/profile/view/menus/customer_Sevice.dart/state/customer_service_state.dart';
import 'package:exam/views/profile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class CustomerServicePage extends StatelessWidget {
  const CustomerServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerServiceCubit, CustomerServiceState>(
      builder: (context, state) {
        return Scaffold(
            appBar: ProfileAppBar.myAppBar(
                title: 'Customer Service', context: context),
            body: body(
                context: context,
                title: 'Jane',
                imgurl:
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'));
      },
      listener: (context, state) {},
    );
  }

  Container body(
      {required BuildContext context,
      required String title,
      required String imgurl}) {
    return Container(
      height: context.h,
      width: context.h,
      padding: EdgeInsets.symmetric(
          horizontal: context.h * 0.02, vertical: context.h * 0.02),
      child: Column(
        children: [
          Container(
            height: context.h * 0.087,
            width: context.h * 0.45,
            padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: ColorConst.greenColor.withOpacity(0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.h * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: context.h * 0.06,
                        width: context.h * 0.06,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(imgurl),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        title,
                        style: MyTextStyle.textStyle(
                            context: context,
                            size: SizeConst.elevatedbuttontextsize),
                      )
                    ],
                  ),
                ),
                SvgPicture.asset('assets/svg/profilesvg/call.svg'),
              ],
            ),
          ).onClick(() {
            debugPrint("salom");
          })
        ],
      ),
    );
  }
}
