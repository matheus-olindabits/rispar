import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rispar_project/app/core/ui/style/colors.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/money_available_page/money_available_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MoneyAvailablePage extends StatefulWidget {

  const MoneyAvailablePage( {Key? key } ) : super(key: key);
  @override
  MoneyAvailablePageState createState() => MoneyAvailablePageState();
}

// ignore: deprecated_member_use
class MoneyAvailablePageState extends ModularState<MoneyAvailablePage, MoneyAvailableController> {

late AcquisitionController acquisitionController;

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Observer(
      builder: (_) {
        return _MoneyAvailabePage();
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget _MoneyAvailabePage() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          SizedBox(
            height: height(context, 0.05),
          ),

          _progressIndicator(),

          SizedBox(
            height: height(context, 0.05),
          ),

          _textToGetMoney(),

          SizedBox(
            height: height(context, 0.1),
          ),

          _formToGetMoney(),

        ],
      ),
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
              onTap: (() => controller.acquisitionController.step = 1),
              child: const Icon(Icons.arrow_back, size: 35, color: primary),
            )
          ),
          SizedBox(
            width: width(context, 0.7),
            child: const StepProgressIndicator(
              totalSteps: 3,
              currentStep: 1,
              size: 8,
              padding: 0,
              selectedColor: primary,
              unselectedColor: light,
              roundedEdges: Radius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textToGetMoney(){
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('De quanto', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
                ),
              ),
              SizedBox(width: 10,),
              Text('você precisa?', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: primary
                ),
              ),
            ]
          ),
          const SizedBox(height: 10),
          const Text('Insira um valor entre R\$ 500,00 a R\$300.000,00', style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

  Widget _formToGetMoney(){
    return SizedBox(
      width: width(context, 1),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width(context, 0.15), 
                  child: const Text('R\$', style: TextStyle(
                    fontSize: 35, color: primary, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: width(context, 0.6),
                  child: TextFormField(
                    style: const TextStyle(
                    fontSize: 30, color: primary, fontWeight: FontWeight.bold),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, CurrencyInputFormatter()],
                    decoration: const InputDecoration(
                      hintText: "0,00",
                      floatingLabelBehavior: FloatingLabelBehavior.always
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite um valor';
                      }else if(controller.convertToDoubleMask(value) < 500 || controller.convertToDoubleMask(value) > 300000 ){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Digite um valor entre R\$ 500,00 e R\$ 3000.000,00')),
                        );
                        return 'Valor não permitido';
                      }else{
                        controller.setGetMoney(controller.convertToDoubleMask(value));
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(
              height: height(context, 0.1),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: width(context, 0.8),
                height: height(context, 0.06),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.acquisitionController.step = 3;
                    }
                  },
                  child: const Text('Continuar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class CurrencyInputFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

        if(newValue.selection.baseOffset == 0){
          return newValue;
        }

        double value = double.parse(newValue.text);

        final formatter = NumberFormat("#,##0.00", "pt_Br" );

        String newText = formatter.format(value/100);

        return newValue.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length)
        );
    }
}
