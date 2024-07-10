import 'package:clean_arch_with_cubit/data/repositories/cart_repository_impl.dart';
import 'package:clean_arch_with_cubit/domain/usecases/add_to_cart_usecase.dart';
import 'package:clean_arch_with_cubit/domain/usecases/get_cart_item_usecase.dart';
import 'package:clean_arch_with_cubit/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUsecase _addToCartUsecase;
  final GetCartItemUsecase _getCartItemUsecase;

  CartCubit()
      : _addToCartUsecase = AddToCartUsecase(CartRepositoryImpl()),
        _getCartItemUsecase = GetCartItemUsecase(CartRepositoryImpl()),
        super(InitialCartState());

   addToCart(Product product) async {
    await _addToCartUsecase.execute(product);
    loadCartItems();
  }

  void loadCartItems() async {
    emit(CartLoadingState());
    final cartItems = await _getCartItemUsecase.execute();
    emit(CartLoadedState(cartItems));
  }
}
