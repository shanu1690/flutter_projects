import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_trading_app/presentation/cubit/app_drawer_cubit.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/item_model.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/navigation_items.dart';
import 'package:sample_trading_app/presentation/states/app_drawer_state.dart';

class CustomNavigationBar extends StatelessWidget {
 CustomNavigationBar({super.key});
 List<DrawerItemModel> listOfItems= [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DrawerItemModel>>(
      future: loadNavigationItems(),
      builder: (context, AsyncSnapshot<List<DrawerItemModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading navigation items'));
        } else {
          final bottomNavigationItems = snapshot.data ?? [];
          return BlocBuilder<AppDrawerCubit, AppDrawerState>(
            builder: (context, state) {
              return BottomNavigationBar(
                items: createNavigationItems(context,bottomNavigationItems),
                currentIndex: state is ItemSelected?state.drawerItemModel.selectedIndex:0,
                selectedItemColor:Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                onTap: (index) {
                  context.read<AppDrawerCubit>().selectItem(listOfItems[index]);
                },
              );
            },
          );
        }
      },
    );
  }

  Future<List<DrawerItemModel>> loadNavigationItems() async {
    NavigationItems navigationItems = NavigationItems();
   listOfItems = await navigationItems.loadItemsFromJson();
    return listOfItems;
  }

  createNavigationItems(BuildContext context, List<DrawerItemModel> bottomNavigationItems) {
    List<BottomNavigationBarItem> listOfNavigationWidget = [];

    for (var item in bottomNavigationItems) {
      listOfNavigationWidget.add(BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor));
    }

    return listOfNavigationWidget;
  }
}
