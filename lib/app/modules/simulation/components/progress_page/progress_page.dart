import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/core/ui/style/colors.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/progress_page/progress_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressPage extends StatefulWidget {

  const ProgressPage( {Key? key } ) : super(key: key);
  @override
  ProgressPageState createState() => ProgressPageState();
}

// ignore: deprecated_member_use
class ProgressPageState extends ModularState<ProgressPage, ProgressController> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return (controller.stepActual > 0 && !controller.loading) ? _progressIndicator(): const SizedBox.shrink();
      },
    );
  }

  Widget _progressIndicator(){
    return SizedBox(
      width: width(context, 1),
      child: Row(
        children: [
          SizedBox(
            width: width(context, 0.2),
            child: InkWell(
              onTap: (() => controller.validateComeBack()),
              child: const Icon(Icons.arrow_back, size: 35, color: primary),
            )
          ),
          SizedBox(
            width: width(context, 0.7),
            child: StepProgressIndicator(
              totalSteps: 3,
              currentStep: controller.stepActual,
              size: 8,
              padding: 0,
              selectedColor: primary,
              unselectedColor: light,
              roundedEdges: const Radius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

}
