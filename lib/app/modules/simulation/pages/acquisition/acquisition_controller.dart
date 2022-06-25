import 'package:mobx/mobx.dart';

part 'acquisition_controller.g.dart';

// ignore: library_private_types_in_public_api
class AcquisitionController = _AcquisitionControllerBase with _$AcquisitionController;

abstract class _AcquisitionControllerBase with Store {

  late String name;
  late String email;
  late double money;

  @observable
  int step = 1;

  @action
  changeStep(int value){
    step = value;
  }

}
