import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/proposal_received.dart';

part 'acquisition_controller.g.dart';

// ignore: library_private_types_in_public_api
class AcquisitionController = _AcquisitionControllerBase with _$AcquisitionController;

abstract class _AcquisitionControllerBase with Store {

  late String name;
  late String email;
  late double money;
  late int parcel;
  late int percentage;
  late ProposalReceived proposalReceived;

  @observable
  int step = 1;

  @action
  changeStep(int value){
    step = value;
  }

}
