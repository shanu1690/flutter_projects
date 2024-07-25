import 'package:flutter/material.dart';

class WatchlistScreen extends StatelessWidget{
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Center(child:Text ("In a Watclist Screen...",style: Theme.of(context).textTheme.bodyMedium)),
    );
  }

}