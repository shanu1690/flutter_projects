import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return Drawer(
        child: ListView(
          children:  [
            const DrawerHeader(
                child: Column(
              children: [
                Text("Username"),
                Text("VersionNo and Name")
              ],
            )),
            BlocBuilder(builder: (context, state) {
              return Column(
                children: [
                  

                ],


              );

            },)
          ],
        ),
      );
    });
  }
  
  Widget createDrawerItem({required IconData icon, required String draweTitle }) {
return ListTile();

  }
}
