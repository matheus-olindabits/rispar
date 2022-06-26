import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/components/progress_page/progress_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

part 'register_controller.g.dart';

// ignore: library_private_types_in_public_api
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();
  ProgressController progressController = Modular.get<ProgressController>();

  void setFullName(String name){
    acquisitionController.name = name;
  }

  void setEmail(String email){
    acquisitionController.email = email;
  }

  setRegister(){
    acquisitionController.changeStep(2);
    progressController.changeStepActual(1);
  }

}
