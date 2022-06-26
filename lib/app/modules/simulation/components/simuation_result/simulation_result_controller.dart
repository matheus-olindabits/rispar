import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/components/progress_page/progress_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

part 'simulation_result_controller.g.dart';

// ignore: library_private_types_in_public_api
class SimulationResultController = _SimulationResultControllerBase with _$SimulationResultController;

abstract class _SimulationResultControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();
  ProgressController progressController = Modular.get<ProgressController>();

  void setStepProgress(){
    progressController.changeStepActual(0);
    acquisitionController.changeStep(1);
  }

}
