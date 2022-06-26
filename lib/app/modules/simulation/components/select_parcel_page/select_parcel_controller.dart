import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/simulation.dart';
import 'package:rispar_project/app/modules/simulation/shared/simulation_service.dart';

part 'select_parcel_controller.g.dart';

// ignore: library_private_types_in_public_api
class SelectParceleController = _SelectParceleControllerBase with _$SelectParceleController;

abstract class _SelectParceleControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();
  SimulationService simulationService = SimulationService();

  @observable
  double parcelValue = 3.0;

  @observable
  double percentageValue = 20.0;

  @observable
  bool loading = false;

  void setParcel(int value){
    acquisitionController.parcel = value;
  }

  void setPercentage(int value){
    acquisitionController.percentage = value;
  }

  Future<void> sendSimluation() async {
    try {
      loading = true;

      Simulation simulation = Simulation(
        fullname: acquisitionController.name, 
        email: acquisitionController.email, 
        ltv: acquisitionController.percentage, 
        amount: acquisitionController.money, 
        term: acquisitionController.parcel, 
        has_protected_collateral: false
      );
      await simulationService.sendSimulation(simulation);
      loading = false;
      print('ok');
    } catch (error) {
      loading = false;
      print('erro');
      //SnackBarErro.snackbarErro(error);
    }
  }


}
