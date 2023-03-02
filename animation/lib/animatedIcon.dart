import 'package:flutter/material.dart';

class animatedIcon extends StatefulWidget {
  const animatedIcon({super.key});

  @override
  State<animatedIcon> createState() => _animatedIconState();
}

class _animatedIconState extends State<animatedIcon>
    with TickerProviderStateMixin {
  bool _isPlay = false;
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (() {
          if (_isPlay == false) {
            _controller.forward();
            _isPlay = true;
          } else {
            _controller.reverse();
            _isPlay = false;
          }
        }),
        child: AnimatedIcon(
          icon: AnimatedIcons.view_list,
          progress: _controller,
          size: 100,
        ),
      ),
    );
  }
}
