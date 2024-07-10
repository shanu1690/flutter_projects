import 'package:clean_arch_with_cubit/data/repositories/cart_repository_impl.dart';
import 'package:clean_arch_with_cubit/domain/entities/cart_item.dart';
import 'package:clean_arch_with_cubit/domain/entities/product.dart';
import 'package:clean_arch_with_cubit/domain/usecases/add_to_cart_usecase.dart';
import 'package:clean_arch_with_cubit/domain/usecases/get_cart_item_usecase.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  AddToCartUsecase addToCartUsecase;
  GetCartItemUsecase getCartItemUseCase;
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  CartProvider()
      : addToCartUsecase = AddToCartUsecase(CartRepositoryImpl()),
        getCartItemUseCase = GetCartItemUsecase(CartRepositoryImpl()) {
    loadCartItems();
  }

  addToCart(Product product) async {
    await addToCartUsecase.execute(product);
    loadCartItems();
  }

  void loadCartItems() async {
    _cartItems = await getCartItemUseCase.execute();
    notifyListeners();
  }
}
