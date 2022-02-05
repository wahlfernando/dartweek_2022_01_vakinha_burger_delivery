
import 'package:vakinha_burger_mobile/app/models/produtct_model.dart';

abstract class ProdutcsRepository {
  Future<List<ProdutctModel>> findAll();
}