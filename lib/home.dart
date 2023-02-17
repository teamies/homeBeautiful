import 'package:flutter/material.dart';
import 'package:home_beautiful/screens/Boarding.dart';
import 'package:home_beautiful/screens/my_cart.dart';
import 'package:home_beautiful/screens/my_reviews.dart';

import 'screens/product_favorites.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Boarding()
      ),
    );
  }
}
