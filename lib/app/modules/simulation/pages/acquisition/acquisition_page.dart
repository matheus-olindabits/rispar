import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

class AcquisitionPage extends StatefulWidget {

  const AcquisitionPage({ Key? key }) : super(key: key);
  @override
  AcquisitionPageState createState() => AcquisitionPageState();
}

class AcquisitionPageState extends ModularState<AcquisitionPage, AcquisitionController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Text('teste'),
      )
    );
  }
}
