import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

part 'progress_controller.g.dart';

// ignore: library_private_types_in_public_api
class ProgressController = _ProgressControllerBase with _$ProgressController;

abstract class _ProgressControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();

  @observable
  int stepActual = 0;

  @observable
  bool loading = false;

  @action
  validateComeBack(){
    if(acquisitionController.step == 2){
      acquisitionController.step = 1;
      stepActual = 0;
    }else if(acquisitionController.step == 3){
      acquisitionController.step = 2;
      stepActual = 1;
    }else if(acquisitionController.step == 4){
      acquisitionController.step = 3;
      stepActual = 2;
    }else{
      acquisitionController.step = 1;
    }
  }

  @action
  changeStepActual(int value){
    stepActual = value;
  }

}
