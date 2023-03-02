import 'dart:math';

import 'package:all/all/hero.dart';
import 'package:flutter/material.dart';

class heart extends StatefulWidget {
  const heart({Key? key}) : super(key: key);

  @override
  State<heart> createState() => _heartState();
}

class _heartState extends State<heart> with TickerProviderStateMixin {
  bool check = true;

  late Animation _arrowAnimation, _heartAnimation;
  late AnimationController _arrowAnimationController, _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);

    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 100.0, end: 120.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Hero(
        tag: 'next',
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimatedScreen()));
                    },
                    child: Text('Next1')),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Next()));
                      },
                      child:
                          Text('Next2'))),


              firstChild(),
              SizedBox(
                height: 50,
              ),
              secondChild(),
              size(),
            ],
          ),
      ),

    );
  }

  Widget firstChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: Icon(
              Icons.expand_more,
              size: 50.0,
              color: Colors.black,
            ),
          ),
        ),
        OutlinedButton(
          // color: Colors.white,
          // textColor: Colors.black,
          // padding: const EdgeInsets.all(12.0),
          child: Text('Start Icon Animation'),
          onPressed: () {
            _arrowAnimationController.isCompleted
                ? _arrowAnimationController.reverse()
                : _arrowAnimationController.forward();
          },
          // splashColor: Colors.red,
        )
      ],
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlinedButton(
              // padding: const EdgeInsets.all(12.0),
              // color: Colors.white,
              // textColor: Colors.black,
              child: Text(check ? 'Start' : 'Stop'),
              onPressed: () {
                check
                    ? _heartAnimationController.forward()
                    : _heartAnimationController.stop();
                setState(() {
                  check = !check;
                });
              },
              // splashColor: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget size() {
    return GestureDetector(
      child: AnimatedBuilder(
        animation: _heartAnimationController,
        builder: (context, child) {
          return Container(
            width: _heartAnimation.value,
            height: _heartAnimation.value,
            color: Colors.yellow,
          );
        },
      ),
      onTap: () {
        check
            ? _heartAnimationController.forward()
            : _heartAnimationController.stop();
        setState(() {
          check = !check;
        });
      },
    );
  }
}

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with TickerProviderStateMixin {
  late Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  late AnimationController _containerAnimationController;

  @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100.0),
            end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerSizeAnimation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: _containerAnimationController));

    _containerAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _containerAnimationController,
          builder: (context, index) {
            return Container(
              width: _containerSizeAnimation.value * width,
              height: _containerSizeAnimation.value * height,
              decoration: BoxDecoration(
                  borderRadius: _containerRadiusAnimation.value,
                  color: _containerColorAnimation.value),
            );
          },
        ),
      ),
    );
  }
}

class Next extends StatefulWidget {
  const Next({Key? key}) : super(key: key);

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Hero(
          tag: 'next',
          child: Column(
                  children: [
                    Text('aa'),
                    Text('aa'),
                  ],
                ),
        ),

           );
  }
}
