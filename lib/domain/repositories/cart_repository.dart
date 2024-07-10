import 'package:clean_arch_with_cubit/domain/entities/cart_item.dart';
import 'package:clean_arch_with_cubit/domain/entities/product.dart';

abstract class CartRepository{

addToCart(Product product);
removeFromCart(Product product);
Future<List<CartItem>> getCartItem();

}