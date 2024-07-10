import 'package:clean_arch_with_cubit/domain/entities/cart_item.dart';
import 'package:clean_arch_with_cubit/domain/entities/product.dart';
import 'package:clean_arch_with_cubit/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  List<CartItem> cartItems = [];

  @override
  addToCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.pId == product.pId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  @override
  Future<List<CartItem>> getCartItem() async {
    // Dummy List of Cart Items
    cartItems.add(CartItem(product: Product(pId: 1,productName: "Black Coat",price: 250),quantity: 1));
    cartItems.add(CartItem(product: Product(pId: 2,productName: "Laptop Bag",price: 1000),quantity: 1));
    cartItems.add(CartItem(product: Product(pId: 3,productName: "Socks",price: 400),quantity: 4));

    return cartItems;
  }

  @override
  removeFromCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.pId == product.pId);

    if (index >= 0) {
      cartItems[index].quantity -= 1;
    } else {
      cartItems.remove(CartItem(product: product));
    }
  }
}
