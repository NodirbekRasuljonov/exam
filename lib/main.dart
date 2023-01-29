import 'package:exam/core/components/theme_comp.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/main/state/main_state.dart';
import 'package:exam/onboarding/auth/cubit/auth-cubit.dart';
import 'package:exam/routes/app_routes.dart';
import 'package:exam/views/cart/cubit/cart_cubit.dart';
import 'package:exam/views/explore/cubit/explore_cubit.dart';
import 'package:exam/views/home/cubit/home_cubit.dart';
import 'package:exam/views/profile/cubit/profile_cubit.dart';
import 'package:exam/views/profile/view/menus/addres/cubit/addres_cubit.dart';
import 'package:exam/views/profile/view/menus/changepasswword/cubit/change_password_cubit.dart';
import 'package:exam/views/profile/view/menus/customer_Sevice.dart/cubit/customer_service_cubit.dart';
import 'package:exam/views/profile/view/menus/editprofile/cubit/edit_profile_cubit.dart';
import 'package:exam/views/profile/view/menus/notifications/cubit/notification_cubit.dart';
import 'package:exam/views/profile/view/menus/orders/cubit/orders_subit.dart';
import 'package:exam/views/profile/view/menus/payment_method/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => ExploreCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
        ),
         BlocProvider(
          create: (context) => EditProfileCubit(),
        ),
        BlocProvider(
          create: (context) => ChnagePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => AddressCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentMethodCubit(),
        ),
         BlocProvider(
          create: (context) => OrdersCubit(),
        ),
         BlocProvider(
          create: (context) => CustomerServiceCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return BlocConsumer<MainCubit, MainState>(
      builder: (context, state) {
        return MaterialApp(
          onGenerateRoute: appRoutes.onGenerateRoute,
          initialRoute: '/splash',
          theme: context.watch<MainCubit>().isDark
              ? ThemeComp.darkmode
              : ThemeComp.lightmode,
          debugShowCheckedModeBanner: false,
        );
      },
      listener: (context, state) {},
    );
  }
}
