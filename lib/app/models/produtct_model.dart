import 'dart:convert';


class ProdutctModel {
  int id;
  String name;
  String description;
  double price;
  String image;
  
  ProdutctModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory ProdutctModel.fromMap(Map<String, dynamic> map) {
    return ProdutctModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutctModel.fromJson(String source) => ProdutctModel.fromMap(json.decode(source));
}
