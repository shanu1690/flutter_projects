import 'package:flutter/material.dart';
import 'package:sample_trading_app/presentation/screens/funds_screen.dart';
import 'package:sample_trading_app/presentation/screens/orders_screen.dart';
import 'package:sample_trading_app/presentation/screens/portfolio_screen.dart';
import 'package:sample_trading_app/presentation/screens/watchlist_screen.dart';

class DrawerItemModel {
  int selectedIndex;
  IconData icon;
  String label;
  Widget route;

  DrawerItemModel(
      {required this.selectedIndex,
      required this.icon,
      required this.label,
      required this.route});

  factory DrawerItemModel.fromJson(Map<String, dynamic> map) {
    return DrawerItemModel(
        selectedIndex: map['index'],
        icon: iconDataFromString(map['icon']),
        label: map['label'],
        route: routeFromString(map['label']));
  }

  static IconData iconDataFromString(String iconName) {
    switch (iconName) {
      case 'home':
        return Icons.home;

      case 'portfolio':
        return Icons.pie_chart;

      case 'orders':
        return Icons.swap_horiz;

      case 'funds':
        return Icons.currency_rupee;

      default:
        return Icons.home;
    }
  }

  static Widget routeFromString(String routeName) {
    switch (routeName) {
      case 'Home':
        return const WatchlistScreen();

      case 'Portfolio':
        return PortfolioScreen();

      case 'Orders':
        return OrdersScreen();

      case 'Funds':
        return FundsScreen();

      default:
        return const WatchlistScreen();
    }
  }
}
