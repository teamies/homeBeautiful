
import 'package:flutter/material.dart';

import 'mytext.dart';

   class notification {
  static void onDelete(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.baseText(text: 'Xoá thành công', fontWeight: FontWeight.bold),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.white,),
    );
  }
 static void onAdd(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.baseText(text: 'Thêm thành công', fontWeight: FontWeight.bold),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.white,),
    );
  }
}