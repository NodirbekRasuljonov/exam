import 'package:exam/views/explore/cubit/explore_cubit.dart';
import 'package:exam/views/explore/state/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Explore Page'),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
