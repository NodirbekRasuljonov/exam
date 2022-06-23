import 'package:exam/views/cart/cubit/cart_cubit.dart';
import 'package:exam/views/cart/state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit,CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart Page'),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
