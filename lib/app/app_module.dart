import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/modules/simulation/components/money_available_page/money_available_controller.dart';
import 'package:rispar_project/app/modules/simulation/components/progress_page/progress_controller.dart';
import 'package:rispar_project/app/modules/simulation/components/register_page/register_controller.dart';
import 'package:rispar_project/app/modules/simulation/components/select_parcel_page/select_parcel_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_page.dart';
import 'package:rispar_project/app/shared/pages/error_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => AcquisitionController()),
    Bind.lazySingleton((i) => RegisterController()),
    Bind.lazySingleton((i) => MoneyAvailableController()),
    Bind.lazySingleton((i) => SelectParceleController()),
    Bind.lazySingleton((i) => ProgressController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => const AcquisitionPage()),
    ChildRoute('/error', child: (_, args) => const ErrorPage()),
  ];
}
