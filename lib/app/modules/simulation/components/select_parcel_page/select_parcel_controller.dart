import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/components/progress_page/progress_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/proposal_received.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/simulation.dart';
import 'package:rispar_project/app/modules/simulation/shared/simulation_service.dart';
import 'package:rispar_project/app/shared/components/catch_error.dart';

part 'select_parcel_controller.g.dart';


// ignore: library_private_types_in_public_api
class SelectParceleController = _SelectParceleControllerBase with _$SelectParceleController;

abstract class _SelectParceleControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();
  ProgressController progressController = Modular.get<ProgressController>();
  SimulationService simulationService = SimulationService();

  @observable
  double parcelValue = 3.0;

  @observable
  double percentageValue = 20.0;

  void initValuesParcelAndPercentage(){
    setParcel(3);
    setPercentage(20);
  }

  void setParcel(int value){
    acquisitionController.parcel = value;
  }

  void setPercentage(int value){
    acquisitionController.percentage = value;
  }

  void setStepProgress(){
     acquisitionController.changeStep(4);
     progressController.changeStepActual(3);
  }

  Future<void> sendSimluation() async {
    try {
      progressController.loading = true;

      Simulation simulation = Simulation(
        fullname: acquisitionController.name, 
        email: acquisitionController.email, 
        ltv: acquisitionController.percentage, 
        amount: acquisitionController.money, 
        term: acquisitionController.parcel, 
        has_protected_collateral: false
      );
      
      final simulationResult = await simulationService.sendSimulation(simulation);

      acquisitionController.proposalReceived = ProposalReceived(
        id: simulationResult.id, fullname: simulationResult.fullname, email: simulationResult.email, ltv: simulationResult.ltv, 
        contract_value: simulationResult.contract_value, net_value: simulationResult.net_value, installment_value: simulationResult.installment_value, 
        last_installment_value: simulationResult.last_installment_value, iof_fee: simulationResult.iof_fee, origination_fee: simulationResult.origination_fee, 
        term: simulationResult.term, collateral: simulationResult.collateral, collateral_in_brl: simulationResult.collateral_in_brl, 
        collateral_unit_price: simulationResult.collateral_unit_price, first_due_date: simulationResult.first_due_date, last_due_date: simulationResult.last_due_date, 
        interest_rate: simulationResult.interest_rate, monthly_rate: simulationResult.monthly_rate, annual_rate: simulationResult.annual_rate
      );

      progressController.loading = false;
      setStepProgress();
    } catch (error) {
      progressController.loading = false;
      CatchError.errorRequest(error);
    }
  }


}
