import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

part 'register_controller.g.dart';

// ignore: library_private_types_in_public_api
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();

  void setFullName(String name){
    acquisitionController.name = name;
  }

  void setEmail(String email){
    acquisitionController.email = email;
  }

}
