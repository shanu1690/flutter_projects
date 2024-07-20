import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_trading_app/presentation/cubit/app_drawer_cubit.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/item_model.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/navigation_items.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

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
          return BlocBuilder<AppDrawerCubit, int>(
            builder: (context, state) {
              return BottomNavigationBar(
                items: createNavigationItems(bottomNavigationItems),
                currentIndex: state,
              );
            },
          );
        }
      },
    );
  }

  Future<List<DrawerItemModel>> loadNavigationItems() async {
    NavigationItems navigationItems = NavigationItems();
    List<DrawerItemModel> listOfItems =
        await navigationItems.loadItemsFromJson();
    return listOfItems;
  }

   
   createNavigationItems(List<DrawerItemModel> bottomNavigationItems){
    List<BottomNavigationBarItem> listOfNavigationWidget = [];

    for (var item in bottomNavigationItems) {
      listOfNavigationWidget.add(
          BottomNavigationBarItem(icon: Icon(item.icon), label: item.label));
    }

    return listOfNavigationWidget;
  }
}
