import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle get titleStyle => TextStyle(
      fontSize: 15,
      fontFamily: 'RobotoRegular',
      fontWeight: FontWeight.w600,
    );

TextStyle titleStyleBold(double size, Color color) => TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'RobotoRegular',
      fontWeight: FontWeight.bold,
    );

TextStyle textStyleSimple(double size) => TextStyle(
      fontSize: size,
      fontFamily: 'RobotoRegular',
    );

TextStyle textStyleSimpleColor(double size, Color color) => TextStyle(
      fontSize: size,
      fontFamily: 'RobotoRegular',
      color: color,
    );

TextStyle textUnderlineStyle(double size) => TextStyle(
      fontSize: size,
      fontFamily: 'RobotoRegular',
      color: primary,
      decoration: TextDecoration.underline,
    );
