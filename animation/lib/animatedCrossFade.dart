import 'dart:ui';

import 'package:flutter/material.dart';

class animatedCrossFade extends StatefulWidget {
  const animatedCrossFade({super.key});

  @override
  State<animatedCrossFade> createState() => _animatedCrossFadeState();
}

class _animatedCrossFadeState extends State<animatedCrossFade> {
  bool _bool = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _bool = !_bool;
              });
            },
            child: Text(
              'Switch',
              style: TextStyle(color: Colors.white),
            )),
        AnimatedCrossFade(
            firstChild: Image.network(
                'https://media.istockphoto.com/id/1340642632/photo/sunflowers.jpg?s=170667a&w=0&k=20&c=yVQkU_vonXZk0M0oLKRA1kKeEW3UCWceBdSDYv_sSmY='),
            secondChild: Image.network(
                'https://media.istockphoto.com/id/1255934700/photo/field-of-young-orange-sunflowers.jpg?s=612x612&w=0&k=20&c=oY4GZ1jlbBGZy0wTOYpJ8wN0Gjml85uHrxRw6l45_SM='),
            crossFadeState:
                _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(seconds: 2))
      ],
    );
  }
}
