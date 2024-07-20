import 'package:flutter/material.dart';

class DrawerItemModel{
IconData icon;
String label;

DrawerItemModel({required this.icon, required this.label});

 factory DrawerItemModel.fromJson(Map<String,dynamic> map)
{
  
  return DrawerItemModel(icon: iconDataFromString(map['icon']), label: map['label']);
}

   static IconData iconDataFromString(String iconName) {
    switch(iconName)
    {
      case 'home' : 
      return  Icons.home;

      case 'portfolio':
      return  Icons.pie_chart;

      case 'orders':
      return Icons.swap_horiz;

      case 'funds':
      return Icons.currency_rupee;

      default:
      return Icons.home;
    }

  }

}