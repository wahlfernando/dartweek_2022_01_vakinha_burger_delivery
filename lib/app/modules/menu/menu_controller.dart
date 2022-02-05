import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader.mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/models/produtct_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/produtts/produtcs_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProdutcsRepository _produtcsRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProdutctModel>[].obs;

  MenuController({required ProdutcsRepository produtcsRepository})
      : _produtcsRepository = produtcsRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListner(_message);
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao buscar produto', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar menu',
          type: MessageTyoe.error));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _produtcsRepository.findAll();

    menu.assignAll(products);
  }

  Future<void> refreshPage()async {
    try {
      await findAllProducts();
    } catch (e, s) {
      log('Erro ao buscar produto', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar menu',
          type: MessageTyoe.error));
    }
  }
}
