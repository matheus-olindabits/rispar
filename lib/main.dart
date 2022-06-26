import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/app_module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rispar_project/app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: '.env'); 
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

