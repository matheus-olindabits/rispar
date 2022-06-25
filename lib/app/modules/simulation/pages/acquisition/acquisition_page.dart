import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/register_page/register_page.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

class AcquisitionPage extends StatefulWidget {

  const AcquisitionPage({ Key? key }) : super(key: key);
  @override
  AcquisitionPageState createState() => AcquisitionPageState();
}

// ignore: deprecated_member_use
class AcquisitionPageState extends ModularState<AcquisitionPage, AcquisitionController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Observer(
        builder: (_) {
          return Center(
            child: _viewPage(controller)
          );
        },
      ),
    );
  }

  Widget _viewPage(AcquisitionController controller) {
    return Stack(
      children: [
        SizedBox(
          height: height(context, 1),
          width: width(context, 1),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: controller.step == 1 ? RegisterPage() : Container(child: Text('teste'),),
          ),
        ),
      ],
    );
  }
}
