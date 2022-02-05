import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constantes/constantes.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader.mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';

import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListner(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      
      final userLogged = await _authRepository.register(name, email, password);
      await _authRepository.register(name, email, password);
      
      _loading.toggle();
      GetStorage().write(Constantes.USER_KEY, userLogged.id);
    } on RestClientException catch (e, s) {
      _loading.toggle();

      log('Erro ao regisrar usuário', error: e, stackTrace: s);
       _message(MessageModel(
          title: "Erro",
          message: e.message,
          type: MessageTyoe.error));
    } catch (e,s){
      _loading.toggle();

      log('Erro ao regisrar usuário', error: e, stackTrace: s);
       _message(MessageModel(
          title: "Erro",
          message: 'Erro ao regisrar usuário',
          type: MessageTyoe.error));
    }
  }
}
