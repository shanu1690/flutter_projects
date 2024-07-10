import 'package:clean_arch_with_cubit/presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
      if (cartProvider.cartItems.isEmpty) {
        return Center(
            child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor)));
      }
      return ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.cartItems[index];
          return ListTile(
            title: Text("${cartItem.product.productName}"),
          );
        },
      );
    }));
  }
}
