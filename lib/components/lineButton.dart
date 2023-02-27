import 'package:flutter/material.dart';

Widget lineButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 30),
    width: MediaQuery.of(context).size.width * 2 / 5,
    decoration: BoxDecoration(border: Border.all(width: 2)),
  );
}