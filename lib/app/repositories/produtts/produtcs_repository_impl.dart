import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/produtct_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/produtts/produtcs_repository.dart';

import './produtcs_repository.dart';

class ProdutcsRepositoryImpl implements ProdutcsRepository {
  final RestClient _restClient;

  ProdutcsRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<ProdutctModel>> findAll() async {
    final result = await _restClient.get('/products/');

    if (result.hasError) {
      log(
        'Erro ao buscar produtos ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current
      );
      throw RestClientException('Erro ao buscar Produto');
    }

    return result.body.map<ProdutctModel>((p) => ProdutctModel.fromMap(p)).toList();
  }
}
