
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/models/produtct_model.dart';
import 'package:vakinha_burger_mobile/app/models/shooping_card_model.dart';

class ShoppiongCardService extends GetxService{
  
  final _shoppingCard = <int, ShoppingCardModel>{}.obs;

  List<ShoppingCardModel> get products => _shoppingCard.values.toList();

  int get totalProducts => _shoppingCard.values.length;

  ShoppingCardModel? getById(int id) => _shoppingCard[id];

  double get totalValue{
    return _shoppingCard.values.fold(0, (totalValue, shoopingCardModel) {
      totalValue += shoopingCardModel.product.price * shoopingCardModel.quantity;
      return totalValue;
    });
  }

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
        return ShoppingCardModel(quantity: quantity, product: product);
      });
    }
  }

  void clear() => _shoppingCard.clear();

}