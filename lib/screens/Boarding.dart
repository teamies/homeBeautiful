import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/LogIn.dart';
class Boarding extends StatelessWidget {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height:  MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(30),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/img/Boarding.png")
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: (() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
              }),
              child: MyText.baseText(text: 'Get Started', color: colorWhite),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff242424),
                padding: EdgeInsets.only(top: 15, bottom: 15)
              ),
        ),
          ),
        ],
      )
    );
  }
}