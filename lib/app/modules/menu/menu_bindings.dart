import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/produtts/produtcs_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/produtts/produtcs_repository_impl.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
    @override
    void dependencies() {
      Get.lazyPut<ProdutcsRepository>(() => ProdutcsRepositoryImpl(restClient: Get.find()));
        Get.put(MenuController(produtcsRepository: Get.find()));
    }
}