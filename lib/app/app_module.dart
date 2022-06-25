import 'package:flutter_modular/flutter_modular.dart';

import 'core/auth/auth_store.dart';
import 'modules/default/erro/erro_page.dart';
import 'modules/default/splash_page/splash_page.dart';
import 'modules/start/pages/start_controller.dart';
import 'modules/start/start_module.dart';
import 'modules/usuario/usuario_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AuthStore()),
        Bind.lazySingleton((i) => StartController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
        ChildRoute('/erro', child: (_, args) => ErroPage()),
        ModuleRoute('/start', module: StartModule()),
        ModuleRoute('/usuario', module: UsuarioModule())
      ];
}
