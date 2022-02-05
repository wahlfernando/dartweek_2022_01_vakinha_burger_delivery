import 'package:get/get.dart';
import './shooping_card_controller.dart';

class ShoopingCardBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ShoopingCardController( authService: Get.find(), shoppiongCardService: Get.find()));
    }
}