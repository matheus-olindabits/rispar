import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/core/ui/style/colors.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/loading_page/loading_page.dart';
import 'package:rispar_project/app/modules/simulation/components/select_parcel_page/select_parcel_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';
import 'package:rispar_project/app/shared/validations/money_validation.dart';

class SelectParcelePage extends StatefulWidget {

  const SelectParcelePage( {Key? key } ) : super(key: key);
  @override
  SelectParcelePageState createState() => SelectParcelePageState();
}

// ignore: deprecated_member_use
class SelectParcelePageState extends ModularState<SelectParcelePage, SelectParceleController> {

late AcquisitionController acquisitionController;

  @override
  void initState() {
    controller.initValuesParcelAndPercentage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Observer(
      builder: (_) {
        return controller.loading ? const LoadingPage() : _selectValuesPage();
      },
    );
  }

  Widget _selectValuesPage() {
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

          _selectParcel(),

          SizedBox(
            height: height(context, 0.05),
          ),

          _selectPercentage(),

          SizedBox(
            height: height(context, 0.05),
          ),

          _textGuarantee(),

          SizedBox(
            height: height(context, 0.05),
          ),

          _buttonGuarantee(),

          SizedBox(
            height: height(context, 0.05),
          ),

        ],
      ),
    );
  }

  Widget _textToGetMoney(){
    return SizedBox(
      child: Column(
        children: [
          const Text('Valor escolhido', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
            ),
          ),
          const SizedBox(height: 10,),
          Text('R\$ ${ MoneyValidation.maskMoneyBr(controller.acquisitionController.money)}', style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: primary
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectParcel(){
    return SizedBox(
      width: width(context, 0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Escolha a quantidade de parcelas', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
            ),
          ),
          Slider(
            value: controller.parcelValue,
            min: 3.0,
            max: 12.0,
            divisions: 3,
            onChanged: (double newValue) {
              controller.parcelValue = newValue;
              controller.setParcel(newValue.toInt());
            },
            activeColor: primary,
            inactiveColor: light,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("6", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("9", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("12", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectPercentage(){
    return SizedBox(
      width: width(context, 0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Escolha o percentual de garantia', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
            ),
          ),
          Slider(
            value: controller.percentageValue,
            min: 20,
            max: 50,
            divisions: 2,
            onChanged: (double newValue) {
              controller.percentageValue = newValue;
              controller.setPercentage(newValue.toInt());
            },
            activeColor: primary,
            inactiveColor: light,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("20%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("35%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("50%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textGuarantee(){
    return SizedBox(
      width: width(context, 0.8),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: const [
            Text('Garantia protegida', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: primary
              ),
            ),
            SizedBox(height: 10,),
            Text('Bitcoin caiu? Fique tranquilo! Na garantia protegida, você não recebe chamada de margem e não é liquidado.', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: primary
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonGuarantee(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            width: width(context, 0.8),
            height: height(context, 0.06),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                primary: Colors.transparent,
                shadowColor: Colors.transparent.withOpacity(0.1),
              ),
              onPressed: () {
                controller.sendSimluation();
              },
              child: const Text('Continuar sem garantia', style: TextStyle(color: primary, fontWeight: FontWeight.bold),),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            width: width(context, 0.8),
            height: height(context, 0.06),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No momento não estamos com essa funcionalidade!')),
                );
              },
              child: const Text('Adicionar garantia', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ],
    );
  }

}
