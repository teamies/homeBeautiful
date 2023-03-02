import 'package:flutter/material.dart';

class animatedDefaultTextStyle extends StatefulWidget {
  const animatedDefaultTextStyle({super.key});

  @override
  State<animatedDefaultTextStyle> createState() =>
      _animatedDefaultTextStyleState();
}

class _animatedDefaultTextStyleState extends State<animatedDefaultTextStyle> {
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          child: AnimatedDefaultTextStyle(
              child: Text('data'),
              style: TextStyle(
                fontSize: _fontSize,
                color: _color,
                fontWeight: FontWeight.bold,
              ),
              duration: Duration(seconds: 2)),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _fontSize = _first ? 90 : 60;
                _color = _first ? Colors.blue : Colors.red;
                _first = !_first;
              });
            },
            child: Text('Switch'))
      ],
    );
  }
}
