import 'package:flutter/material.dart';
import 'package:home_beautiful/core/tocolor.dart';
import 'package:home_beautiful/core/_config.dart' as cnf;

class MyText {
  
  static Widget baseText(
      {String text = 'base',
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
          //overflow: TextOverflow.ellipsis,
          decoration: decoration,
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor()),
    );
  }
  static TextStyle textStyle(
      {
      dynamic size = 18,
      FontWeight fontWeight = FontWeight.w500,
      String color = cnf.colorBlack,
      TextAlign? textAlign,
      TextDecoration? decoration}) {
    return TextStyle(
          decoration: decoration,
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor());
  }
}