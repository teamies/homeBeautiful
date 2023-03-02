import 'package:flutter/material.dart';
import 'dart:math';

class animatedBuilder extends StatefulWidget {
  const animatedBuilder({super.key});

  @override
  State<animatedBuilder> createState() => _animatedBuilderState();
}

class _animatedBuilderState extends State<animatedBuilder>
    with TickerProviderStateMixin {
  //----------------------------
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 10), vsync: this)
        ..repeat();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 20,
          child: child,
        );
      },
      child: FlutterLogo(size: 30),
    );
  }
}
