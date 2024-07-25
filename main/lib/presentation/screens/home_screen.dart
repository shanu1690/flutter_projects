import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_trading_app/presentation/cubit/app_drawer_cubit.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/custom_navigation_bar.dart';
import 'package:sample_trading_app/presentation/states/app_drawer_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AppDrawerCubit, AppDrawerState>(
          builder: (context, state) {
            return Text(
              state is ItemSelected ? state.drawerItemModel.label : "Watchlist",
              style: Theme.of(context).textTheme.bodyMedium,
            );
          },
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      body: BlocBuilder<AppDrawerCubit, AppDrawerState>(
        builder: (context, state) {
          return state is ItemSelected
              ? state.drawerItemModel.route
              : Container();
        },
      ),
    );
  }
}
