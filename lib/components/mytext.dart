import 'package:flutter/material.dart';
import 'package:home_beautiful/core/tocolor.dart';
import 'package:home_beautiful/core/_config.dart' as cnf;

class MyText {
  /**
   * Dành cho các text cơ bản thường dùng trong app
   */
  static Widget baseText(
      {
        String text = 'base',
      dynamic size = 18,
      FontWeight fontWeight = FontWeight.w500,
      String color = cnf.colorBlack,
      TextAlign? textAlign,
      TextDecoration? decoration}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
          decoration: decoration,
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor()),
    );
  }
}