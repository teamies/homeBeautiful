import 'package:animation/animatedAlign.dart';
import 'package:animation/animatedContained.dart';
import 'package:animation/animatedCrossFade.dart';
import 'package:animation/animatedDefaultTextStyle.dart';
import 'package:animation/animatedIcon.dart';
import 'package:animation/animatedList.dart';
import 'package:animation/animatedbuilder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
//--------------------------------------------------------------AnimatedAlign
                animatedAlign(),
//----------------------------------------------------------------AnimatedBuilder
                animatedBuilder(),
//-----------------------------------AnimatedContainer
                animatedContained(),
//-----------------------------------AnimatedCrossFade
                animatedCrossFade(),
//------------------------------------------AnimatedDefaultTextStylle
                animatedDefaultTextStyle(),

//----------------------------------------AnimatedIcon
                animatedIcon(),

//---------------------------------------AnimatedList
                animatedList(),
//---------------------------------------
              ],
            )
          ],
        ),
      ),
    );
  }
}
