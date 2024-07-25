import 'package:flutter/material.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/item_model.dart';
import 'package:sample_trading_app/presentation/screens/watchlist_screen.dart';

abstract class AppDrawerState{}

class DrawerInitialState extends AppDrawerState{
  DrawerInitialState(){
   DrawerItemModel(selectedIndex: 0, icon: Icons.home, label: "WatchList", route: const WatchlistScreen());
  }
}

class ItemSelected extends AppDrawerState{
  DrawerItemModel drawerItemModel;
  ItemSelected(this.drawerItemModel);

}



