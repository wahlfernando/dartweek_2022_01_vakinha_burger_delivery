import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/services/shoppiong_card_service.dart';
import 'package:vakinha_burger_mobile/app/models/shooping_card_model.dart';

class ShoopingCardController extends GetxController {
  final AuthService _authService;
  final ShoppiongCardService _shoppiongCardService;

  final _adress = ''.obs;
  final _cpf = ''.obs;

  ShoopingCardController(
      {required AuthService authService,
      required ShoppiongCardService shoppiongCardService})
      : _shoppiongCardService = shoppiongCardService,
        _authService = authService;

  List<ShoppingCardModel> get products => _shoppiongCardService.products;

  double get totalValue => _shoppiongCardService.totalValue;

  set address(String address) => _adress.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppiongCardService.addAndRemoveProductInShoopingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity + 1);
  }

  void substractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppiongCardService.addAndRemoveProductInShoopingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity - 1);
  }

  void clear(){
    _shoppiongCardService.clear();
    update();
  } 
}
