
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/models/produtct_model.dart';
import 'package:vakinha_burger_mobile/app/models/shooping_card_model.dart';

class ShoppiongCardService extends GetxService{
  
  final _shoppingCard = <int, ShoopingCardModel>{}.obs;

  List<ShoopingCardModel> get products => _shoppingCard.values.toList();

  int get totalProducts => _shoppingCard.values.length;

  ShoopingCardModel? getById(int id) => _shoppingCard[id];

  void addAndRemoveProductInShoopingCard(
    ProdutctModel product,{
    required int quantity}
  ){
    if (quantity == 0) {
      _shoppingCard.remove(product.id);
    } else{
      _shoppingCard.update(product.id, (product) {
        product.quantity = quantity;  
        return product;
      }, ifAbsent: (){
        return ShoopingCardModel(quantity: quantity, product: product);
      });
    }
  }

}