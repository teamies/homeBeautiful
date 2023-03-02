import 'package:flutter/material.dart';

class animatedAlign extends StatefulWidget {
  const animatedAlign({super.key});

  @override
  State<animatedAlign> createState() => _animatedAlignState();
}

class _animatedAlignState extends State<animatedAlign> {
  //-----------------------
  bool select = false;
  //-----------------------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          select = !select;
        });
      }),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 150,
        color: Colors.blueGrey,
        child: AnimatedAlign(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          alignment: select ? Alignment.topRight : Alignment.bottomLeft,
          child: FlutterLogo(size: 50),
        ),
      ),
    );
  }
}
