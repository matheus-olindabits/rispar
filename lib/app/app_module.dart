import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/modules/simulation/components/register_page/register_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => AcquisitionController()),
    Bind.lazySingleton((i) => RegisterController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => const AcquisitionPage()),
  ];
}
