import 'dart:async';

import 'package:exam/core/components/my_textstyle.dart';
import 'package:exam/core/constants/size_constants.dart';
import 'package:exam/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.h,
        width: context.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/logo.svg'),
              SizedBox(
                height: context.h * 0.024,
              ),
              Container(
                alignment: Alignment.center,
                height: context.h * 0.036,
                width: context.h * 0.115,
                child: Text(
                  'Organico',
                  style: MyTextStyle.textStyle(
                    context: context,
                    size: SizeConst.splashtextsize,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
