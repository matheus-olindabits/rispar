import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/core/ui/style/colors.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/simuation_result/simulation_result_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:rispar_project/app/shared/validations/money_validation.dart';

class SimulationResultPage extends StatefulWidget {

  const   SimulationResultPage( {Key? key } ) : super(key: key);
  @override
  SimulationResultPageState createState() => SimulationResultPageState();
}

// ignore: deprecated_member_use
class SimulationResultPageState extends ModularState<SimulationResultPage, SimulationResultController> {

late AcquisitionController acquisitionController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Observer(
      builder: (_) {
        return _moneyAvailabePage();
      },
    );
  }

  Widget _moneyAvailabePage() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [

          SizedBox(
            height: height(context, 0.05),
          ),

          _textToGetMoney(),

          SizedBox(
            height: height(context, 0.05),
          ),

          _tableResult(),

          SizedBox(
            height: height(context, 0.05),
          ),

          _buttonNewSimulation(),

          SizedBox(
            height: height(context, 0.05),
          ),

        ],
      ),
    );
  }

  Widget _textToGetMoney(){
    return const SizedBox(
      child: Text('Resultado da simulação', style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        ),
      ),
    );
  }

  Widget _tableResult(){
    return SizedBox(
      width: width(context, 0.8),
      child: Column(
        children: [
          _registerOfResultSimulation('Valor escolhido', 'R\$ ${MoneyValidation.maskMoneyBr(controller.acquisitionController.proposalReceived.net_value)}'),
          _dividerByLine(),
          _registerOfResultSimulation('Garantia', (controller.acquisitionController.proposalReceived.collateral/100000000).toString()),
          _dividerByLine(),
          _registerOfResultSimulation('Taxa de Juros', '${controller.acquisitionController.proposalReceived.interest_rate}% a.m'),
          _dividerByLine(),
          _registerOfResultSimulation('Percentual de garantia', '${controller.acquisitionController.proposalReceived.ltv}%'),
          _dividerByLine(),
          _registerOfResultSimulation('Primeiro vencimento', MoneyValidation.convertDate(controller.acquisitionController.proposalReceived.first_due_date)),
          _dividerByLine(),
          _registerOfResultSimulation('IOF', 'R\$ ${MoneyValidation.maskMoneyBr(controller.acquisitionController.proposalReceived.iof_fee)}'),
          _dividerByLine(),
          _registerOfResultSimulation('Total financiado', 'R\$ ${MoneyValidation.maskMoneyBr(controller.acquisitionController.proposalReceived.contract_value)}'),
          _dividerByLine(),
          _registerOfResultSimulation('CET mensal', '${MoneyValidation.maskMoneyBr(controller.acquisitionController.proposalReceived.monthly_rate)}%'),
          _dividerByLine(),
          _registerOfResultSimulation('CET anual', '${MoneyValidation.maskMoneyBr(controller.acquisitionController.proposalReceived.annual_rate)}%'),
          _dividerByLine(),
          _registerOfResultSimulation('Cotação do BTC', 'R\$ ${MoneyValidation.maskMoneyBr(controller.acquisitionController.proposalReceived.collateral_unit_price)}'),
          _dividerByLine(),
        ],
      ),
    );
  }

  Widget _buttonNewSimulation(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: width(context, 0.8),
        height: height(context, 0.06),
        child: ElevatedButton(
          onPressed: () {
            controller.setStepProgress();
          },
          child: const Text('Nova simulação', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }

  Widget _dividerByLine(){
    return const Divider(
      height: 25,
      thickness: 1,
      indent: 10,
      endIndent: 0,
      color: light
    );
  }

  Widget _registerOfResultSimulation(String column, String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(column, style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(value, style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
        ),
      ],
    );
  }

}
