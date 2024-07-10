import 'package:clean_arch_with_cubit/presentation/cubit/cart_cubit.dart';
import 'package:clean_arch_with_cubit/presentation/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenCubit extends StatelessWidget {
  const CartScreenCubit({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    cartCubit.loadCartItems();
    return Scaffold(body: BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          Center(
              child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor));
        } else if (state is CartLoadedState) {
          return ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = state.cartItems[index];
              return ListTile(
                title: Text("${cartItem.product.productName}"),
              );
            },
          );
        }
        return const Center(child: Text("Something went Wrong !!"));
      },
    ));
  }
}
