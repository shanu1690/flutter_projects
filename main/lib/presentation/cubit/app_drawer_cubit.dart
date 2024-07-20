import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawerCubit extends Cubit<int>{
  AppDrawerCubit():super(0);

  void selectItem(int index)
  {
    emit(index);
  }


}