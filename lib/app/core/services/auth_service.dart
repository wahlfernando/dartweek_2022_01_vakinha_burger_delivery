
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constantes/constantes.dart';

class AuthService extends GetxService{

  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init()async {
    _getStorage.listenKey(Constantes.USER_KEY, (value) {
        // if(value != null){
        //   isLogged(true);
        // } else {
        //   isLogged(false);
        // }
        _isLogged(value != null);
     });

    //Toda vez que vai ter alguma modificação no _isLogged, vai ser executado esse ever, por isso que a logica de redirecionamento 
    //deve estar ali para reaproveitamento de código.
    ever<bool?>(_isLogged, (isLogged){
      if(_isLogged == null || !isLogged!){
        Get.offAllNamed('/auth/login');
      } else{
        Get.offAllNamed('/home');
      }
    });

    //Recuopera logo de cara que não tem tem nenhuma pessoa logada
    // final isLoggedData = getUserId() != null;
    _isLogged(getUserId() != null);

    return this;
  }

  void logout() => _getStorage.write(Constantes.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constantes.USER_KEY);  

}