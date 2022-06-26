import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _errorPage(context)
      ),
    );

  }

  Widget _errorPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: const [
            Text('Ops, algo ocorreu!', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20,),
            Text('Não foi possível realizar a ação.\n Tente novamente mais tarde.', style: TextStyle(
              fontSize: 15
            ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            width: width(context, 0.8),
            height: height(context, 0.06),
            child: ElevatedButton(
              onPressed: () {
                Modular.to.pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
              },
              child: const Text('Tentar uma nova simulação', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ],
    );
  }
}
