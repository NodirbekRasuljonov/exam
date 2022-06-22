import 'package:exam/onboarding/auth/cubit/auth-cubit.dart';
import 'package:exam/onboarding/auth/state/auth_state.dart';
import 'package:exam/onboarding/auth/widgets/auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AuthAppBar.myAppBar(title: 'Reset Password', context: context),
        );
      },
      listener: (context, state) {},
    );
  }
}
