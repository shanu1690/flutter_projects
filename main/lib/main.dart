import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_trading_app/presentation/cubit/theme_cubit.dart';
import 'package:sample_trading_app/presentation/screens/home_screen.dart';
import 'package:sample_trading_app/presentation/themes/app_theme.dart';
import 'package:sample_trading_app/presentation/themes/theme_data.dart';

void main() {
  runApp(
      BlocProvider<ThemeCubit>(create: (context) => ThemeCubit(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          title: "Trading App",
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: AppTheme.themeMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}
