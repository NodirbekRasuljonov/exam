import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/color_const.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h,
      width: context.h,
      padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.h * 0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: context.h * 0.25,
              width: context.h * 0.3,
              child: context.watch<MainCubit>().isDark
                  ? SvgPicture.asset('assets/svg/profilesvg/orders/emptydark.svg')
                  : SvgPicture.asset('assets/svg/profilesvg/orders/empty.svg'),
            ),
            SizedBox(
              height: context.h * 0.03,
            ),
            Text(
              'Opps! We can’t find your product! Try search another product.',
              style: MyTextStyle.textStyle(
                context: context,
                size: SizeConst.homeAppBarTitle,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.h*0.03,),
            Container(
              height: context.h,
              width: context.h * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent',
                    style: MyTextStyle.textStyle(
                        context: context, size: SizeConst.homeAppBarTitle),
                  ),
                  SizedBox(height: context.h*0.01,),
                  recent(title: 'Onion'),
                  recent(title: 'Watermelon'),
                  recent(title: 'Blaccurrant'),
                  recent(title: 'Mushroom')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile recent({required String title}){
    return ListTile(
      leading: Icon(Icons.search_outlined,color: ColorConst.greyColor,),
      title: Text(title,style: TextStyle(color: ColorConst.greyColor),),
      trailing: Icon(Icons.cancel_outlined,color: Colors.red,),
      
    );
    }
}
