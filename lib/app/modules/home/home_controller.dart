import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/services/shoppiong_card_service.dart';
import 'package:vakinha_burger_mobile/app/models/shooping_card_model.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_page.dart';

class HomeController extends GetxController {

  static const NAVIGATOR_KEY = 1; 

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card', '/exit'];
  final ShoppiongCardService _shoppiongCardService;

  HomeController({required ShoppiongCardService shoppiongCardService}) : _shoppiongCardService = shoppiongCardService;

  int get tabIndex => _tabIndex.value;

  int get totalProductsInShoopingCard => _shoppiongCardService.totalProducts;

  set tabIndex(int index){
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    }else{
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
      if (settings.name == '/menu') {
          return GetPageRoute(
            settings: settings,
            page: () => const MenuPage(),
            binding: MenuBindings(),
            transition: Transition.fadeIn
          );
      }
      
      if (settings.name == '/order/shopping_card') {
         return GetPageRoute(
        settings: settings,
        page: () => MenuPage(),
       transition: Transition.fadeIn,
      );
      }
      
  }
}
