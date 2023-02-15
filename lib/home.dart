import 'package:flutter/material.dart';
import 'package:home_beautiful/screens/Boarding.dart';

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
