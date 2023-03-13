
import 'package:flutter/material.dart';

import 'mytext.dart';

   class notification {
  static void onDelete(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Xoá thành công'),
        duration: Duration(seconds: 1),
      ),
    );
  }
 static void onAdd(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
        content: Text('Thêm thành công'),
        duration: Duration(seconds: 1),
      ),
    );
  }

}