import 'package:clean_arch_with_cubit/domain/entities/product.dart';

class CartItem{
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity=1});
  
}