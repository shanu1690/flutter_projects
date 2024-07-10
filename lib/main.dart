import 'package:clean_arch_with_cubit/presentation/cubit/cart_cubit.dart';
import 'package:clean_arch_with_cubit/presentation/provider/cart_provider.dart';
import 'package:clean_arch_with_cubit/presentation/screens/cart_screen.dart';
import 'package:clean_arch_with_cubit/presentation/screens/cart_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<CartCubit>(
    //   create: (context) => CartCubit(),
    //   child: const MaterialApp(
    //     title: "Shopping Cart",
    //     home: Scaffold(
    //       body: Center(child: CartScreenCubit()),
    //     ),
    //   ),
    // );

    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(
        title: "Shopping Cart",
        home: Scaffold(
          body: Center(child: CartScreen()),
        ),
      ),
    );
  }
}
