import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_trading_app/presentation/themes/theme_data.dart';

class ThemeCubit extends Cubit<ThemeData>{
  ThemeCubit():super(lightTheme);


  toggleTheme(){
    emit(state.brightness==Brightness.dark?darkTheme:lightTheme);
  }


}