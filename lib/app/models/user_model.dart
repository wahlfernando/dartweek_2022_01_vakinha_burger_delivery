import 'dart:convert';


class UserModel {
  
  final int id;
  final String nome;
  final String email;
  final String password;
  
  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.password,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
