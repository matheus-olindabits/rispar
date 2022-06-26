import 'package:flutter/material.dart';
import 'package:rispar_project/app/core/ui/style/colors.dart';
import 'package:rispar_project/app/core/ui/style/size.dart';
import 'package:rispar_project/app/core/ui/style/text_style.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _loading(context)
    );
  }

  Widget _loading(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: height(context, .2),
        ),
        const Center(
          child: CircularProgressIndicator(color: primary),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: const [
            Text('Aguarde um momento', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20,),
            Text('Estamos simulando seu pedido de \n crédito Rispar...', style: TextStyle(
              fontSize: 15
            ),
            ),
          ],
        ),
      ],
    );
  }
}
