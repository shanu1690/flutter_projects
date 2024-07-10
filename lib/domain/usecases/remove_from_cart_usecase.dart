import 'package:clean_arch_with_cubit/domain/entities/product.dart';
import 'package:clean_arch_with_cubit/domain/repositories/cart_repository.dart';

class RemoveFromCartUsecase {
  final CartRepository _cartRepository;

  RemoveFromCartUsecase(this._cartRepository);

  execute(Product product) async {
    return _cartRepository.removeFromCart(product);
  }
}
