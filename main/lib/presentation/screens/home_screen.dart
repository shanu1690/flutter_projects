import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_trading_app/presentation/cubit/app_drawer_cubit.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/custom_navigation_bar.dart';
import 'package:sample_trading_app/presentation/screens/watchlist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppDrawerCubit>(
      create: (context) => AppDrawerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WatchList"),
        ),
        bottomNavigationBar: const CustomNavigationBar(),
        body: const WatchlistScreen(),
      ),
    );
  }
}
