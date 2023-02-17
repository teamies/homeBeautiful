import 'package:flutter/material.dart';
import 'package:home_beautiful/screens/notification.dart';

import 'screens/my_cart.dart';
import 'screens/product_favorites.dart';
import 'screens/profile.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: product_favorites()
      );
  }
}
