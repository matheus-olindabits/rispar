import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/core/ui/style/colors.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/money_available_page/money_available_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:rispar_project/app/shared/validations/money_validation.dart';

class MoneyAvailablePage extends StatefulWidget {

  const   MoneyAvailablePage( {Key? key } ) : super(key: key);
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
            height: height(context, 0.1),
          ),

          _formToGetMoney(),

        ],
      ),
    );
  }

  Widget _textToGetMoney(){
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('De quanto', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('voc?? precisa?', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: primary
                    ),
                  ),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: width(context, 0.1)),
                    child: const Text('R\$', style: TextStyle(
                      fontSize: 35, color: primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: width(context, 0.1)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                      fontSize: 30, color: primary, fontWeight: FontWeight.bold),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly, MoneyValidation()],
                      decoration: const InputDecoration(
                        hintText: "0,00",
                        floatingLabelBehavior: FloatingLabelBehavior.always
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite um valor';
                        }else if(MoneyValidation.convertToDoubleMask(value) < 500 || MoneyValidation.convertToDoubleMask(value) > 300000 ){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Digite um valor entre R\$ 500,00 e R\$ 3000.000,00')),
                          );
                          return 'Valor n??o permitido';
                        }else{
                          controller.setGetMoney(MoneyValidation.convertToDoubleMask(value));
                        }
                        return null;
                      },
                    ),
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
                      controller.setStepProgress();
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
