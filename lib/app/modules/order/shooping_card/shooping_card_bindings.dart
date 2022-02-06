import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/order/order_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/order/order_repository_impl.dart';
import './shooping_card_controller.dart';

class ShoopingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()));
    Get.put(
      ShoopingCardController(
          authService: Get.find(),
          shoppiongCardService: Get.find(),
          orderRepository: Get.find()),
    );
  }
}
