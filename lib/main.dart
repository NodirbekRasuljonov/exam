import 'package:exam/core/components/theme_comp.dart';
import 'package:exam/main/cubit/main_cubit.dart';
import 'package:exam/main/state/main_state.dart';
import 'package:exam/onboarding/auth/cubit/signin_cubit.dart';
import 'package:exam/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => MainCubit(),
      ),
      BlocProvider(
        create: (context) => SignInCubit(),
      ),
    ],
    child: MyApp(),
  ));
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
            initialRoute: '/signIn',
            theme: context.watch<MainCubit>().isDark
                ? ThemeComp.darkmode
                : ThemeComp.lightmode,
            debugShowCheckedModeBanner: false,
          );
        },
        listener: (context, state) {});
  }
}
