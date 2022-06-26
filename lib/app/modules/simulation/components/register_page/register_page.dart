import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rispar_project/app/core/ui/style/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/modules/simulation/components/register_page/register_controller.dart';
import 'package:rispar_project/app/modules/simulation/pages/acquisition/acquisition_controller.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage( {Key? key } ) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

// ignore: deprecated_member_use
class RegisterPageState extends ModularState<RegisterPage, RegisterController> {

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
        return _registerPage();
      },
    );
  }

  Widget _registerPage() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          SizedBox(
            height: height(context, 0.1),
          ),

          _imageRegister(),

          SizedBox(
            height: height(context, 0.05),
          ),

          _textToRegister(),

          SizedBox(
            height: height(context, 0.03),
          ),

          _formToRegsiter(),

        ],
      ),
    );
  }

  Widget _imageRegister(){
    return SizedBox(
      height: height(context, 0.2),
      width: width(context, 0.6),
      child: SvgPicture.asset(
        "assets/images/man_rocket.svg",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _textToRegister(){
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Simule', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
                ),
              ),
              SizedBox(width: 10,),
              Text('agora', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: primary
                ),
              ),
            ]
          ),
          const SizedBox(height: 10),
          const Text('Crédito rápido, fácil e seguro! :)')
        ],
      ),
    );
  }

  Widget _formToRegsiter(){
    return SizedBox(
      width: width(context, 0.8),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Qual seu nome completo?',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
                hintText: "Nome completo",
                floatingLabelBehavior: FloatingLabelBehavior.always
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite seu nome completo';
                }else{
                  controller.setFullName(value);
                }
                return null;
              },
            ),

            SizedBox(
              height: height(context, 0.03),
            ),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'E seu e-mail?',
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
                hintText: "seuemail@email.com",
                floatingLabelBehavior: FloatingLabelBehavior.always
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite seu e-mail';
                }else if(!EmailValidator.validate(value)){
                  return 'Por favor, digite um e-mail válido';
                }else{
                  controller.setEmail(value);
                }
              },
            ),

            SizedBox(
              height: height(context, 0.03),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: width(context, 0.8),
                height: height(context, 0.06),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                      controller.acquisitionController.step = 2;
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
