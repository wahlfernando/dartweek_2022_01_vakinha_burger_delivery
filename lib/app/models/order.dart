
import 'package:vakinha_burger_mobile/app/models/shooping_card_model.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCardModel> items;
  
  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });
}
