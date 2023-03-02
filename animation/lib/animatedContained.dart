import 'package:flutter/material.dart';

class animatedContained extends StatefulWidget {
  const animatedContained({super.key});

  @override
  State<animatedContained> createState() => _animatedContainedState();
}

class _animatedContainedState extends State<animatedContained> {
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = !select;
        });
      },
      child: Center(
        child: AnimatedContainer(
          color: Colors.blue,
          width: select ? 200 : 100,
          height: select ? 100 : 200,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          alignment: select ? Alignment.center : Alignment.topCenter,
          child: FlutterLogo(size: 70),
        ),
      ),
    );
  }
}
