import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/screens/LogIn.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
                const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
            // color: Colors.blue.shade200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/imgThienNhien1.jpg"))),
        child: ListView(
          children: [
             MyText.baseText(text: 'Hello!'),
          MyText.baseText(text: 'WELCOME BACK', size: 50, fontWeight: FontWeight.w700)
          ],
        ),
      ),
    );
  }
}