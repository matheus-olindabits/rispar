import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/components/progress_page/progress_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

part 'money_available_controller.g.dart';

// ignore: library_private_types_in_public_api
class MoneyAvailableController = _MoneyAvailableControllerBase with _$MoneyAvailableController;

abstract class _MoneyAvailableControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();
  ProgressController progressController = Modular.get<ProgressController>();

  void setGetMoney(double value){
    acquisitionController.money = value;
  }

  void setStepProgress(){
     acquisitionController.step = 3;
     progressController.stepActual = 2;
  }

  double convertToDoubleMask(String value){
    var valor = value.replaceAll('.', '');
    valor = valor.replaceAll(',', '.');
    return double.parse(valor);
  }

}
