import 'package:clean_arch_with_cubit/domain/entities/product.dart';
import 'package:clean_arch_with_cubit/domain/repositories/cart_repository.dart';

class AddToCartUsecase{
final CartRepository _cartRepository;

AddToCartUsecase(this._cartRepository);


  execute(Product product) async{
    return _cartRepository.addToCart(product);
}

}