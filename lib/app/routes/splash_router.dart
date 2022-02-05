import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splashpage.dart';

class SplashRouter {
  SplashRouter._();

  static final routes = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const Splashpage(),
    )
  ];
}
