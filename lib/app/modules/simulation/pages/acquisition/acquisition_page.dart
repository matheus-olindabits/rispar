import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/money_available_page/money_available_page.dart';
import 'package:rispar_project/app/modules/simulation/components/progress_page/progress_page.dart';
import 'package:rispar_project/app/modules/simulation/components/register_page/register_page.dart';
import 'package:rispar_project/app/modules/simulation/components/select_parcel_page/select_parcel_page.dart';
import 'package:rispar_project/app/modules/simulation/components/simuation_result/simulation_result_page.dart';
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
            child: Column(
              children: [
                SizedBox(height: height(context, 0.05)),
                const ProgressPage(),
                SizedBox(
                  child: controller.step == 1 ? const RegisterPage() : controller.step == 2 ? const MoneyAvailablePage() : controller.step == 3 ? const SelectParcelePage() : controller.step == 4 ? const SimulationResultPage() : const RegisterPage()
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
