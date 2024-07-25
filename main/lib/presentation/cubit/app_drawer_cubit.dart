import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/item_model.dart';
import 'package:sample_trading_app/presentation/states/app_drawer_state.dart';

class AppDrawerCubit extends Cubit<AppDrawerState>{
  AppDrawerCubit():super(DrawerInitialState());

  void selectItem(DrawerItemModel drawerItem)
  {
    emit(ItemSelected(drawerItem));
  }


}