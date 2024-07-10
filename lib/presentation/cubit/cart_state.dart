import 'package:clean_arch_with_cubit/domain/entities/cart_item.dart';

abstract class CartState{}

class InitialCartState extends CartState{}

class CartLoadingState extends CartState{}

class CartLoadedState extends CartState{

  final List<CartItem> cartItems;
  CartLoadedState(this.cartItems); 
}

class CartLoadFail extends CartState{

String showError()
{
  return "Cart Failed to Load...";
}

}