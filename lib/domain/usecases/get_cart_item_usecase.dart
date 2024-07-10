import 'package:clean_arch_with_cubit/domain/entities/cart_item.dart';
import 'package:clean_arch_with_cubit/domain/repositories/cart_repository.dart';

class GetCartItemUsecase {
  final CartRepository _cartRepository;

  GetCartItemUsecase(this._cartRepository);

 Future<List<CartItem>> execute() async {
    return _cartRepository.getCartItem();
  }
}
