
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyValidation extends TextInputFormatter{

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.selection.baseOffset == 0) return newValue;
    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0.00", "pt_Br" );
    String newText = formatter.format(value/100);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length)
    );
  }

  static maskMoneyBr(double value ) {
    final formatter = NumberFormat("#,##0.00", "pt_Br" );
    String newText = formatter.format(value);
    return newText;
  }

  static double convertToDoubleMask(String value){
    var valor = value.replaceAll('.', '');
    valor = valor.replaceAll(',', '.');
    return double.parse(valor);
  }

  static double changeDotToComma(String value){
    var valor = value.replaceAll('.', ',');
    return double.parse(valor);
  }

  static String convertDate(String date){
    return '${date.substring(8, 10)}/${date.substring(5, 7)}/${date.substring(0, 4)}';
  }

}