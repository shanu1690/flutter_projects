import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget{
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      child: Center(child:Text ("In a Portfolio Screen...",style: Theme.of(context).textTheme.bodyMedium)),
    );

  }

}