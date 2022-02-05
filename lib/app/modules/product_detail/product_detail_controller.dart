import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/shoppiong_card_service.dart';
import 'package:vakinha_burger_mobile/app/models/produtct_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProdutctModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;
  final ShoppiongCardService _shoppiongCardService;
  final _allReadyAdded = false.obs;

  ProductDetailController({
    required ShoppiongCardService shoppiongCardService,
  }) : _shoppiongCardService = shoppiongCardService;

  ProdutctModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;
  bool get allReadyAdded => _allReadyAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    final productShoopingCard = _shoppiongCardService.getById(product.id);
    
    if (productShoopingCard !=  null) {
      _quantity(productShoopingCard.quantity);  
      _allReadyAdded(true);
    }
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoopingCard(){
    _shoppiongCardService.addAndRemoveProductInShoopingCard(product, quantity: quantity);
    Get.back();
  }



}
