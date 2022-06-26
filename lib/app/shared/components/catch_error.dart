import 'package:alert/alert.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CatchError {

  static void errorRequest(dynamic erro) {
    try {
      if (erro.error != null) {
        if (erro.response.data != null) {
          if (erro.response.statusCode >= 400 && erro.response.statusCode < 500) {
            Alert(message: erro.response.data).show();
          }else{
            Modular.to.pushNamedAndRemoveUntil('/error', (_) => false);
          }
        }
      }
    } catch (e) {
      Modular.to.pushNamedAndRemoveUntil('/error', (_) => false);
    }
  }

}
