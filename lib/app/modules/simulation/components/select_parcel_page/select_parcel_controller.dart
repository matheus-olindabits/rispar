import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

part 'select_parcel_controller.g.dart';

// ignore: library_private_types_in_public_api
class SelectParceleController = _SelectParceleControllerBase with _$SelectParceleController;

abstract class _SelectParceleControllerBase with Store {

  AcquisitionController acquisitionController = Modular.get<AcquisitionController>();

  @observable
  double parcelValue = 3.0;

  @observable
  double percentageValue = 20.0;


}
