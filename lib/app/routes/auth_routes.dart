import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static final routes = <GetPage>[
    GetPage(
      name: '/auth/login',
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    )
  ];
}
