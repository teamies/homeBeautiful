import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/LogIn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

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
                image: AssetImage("assets/img/Boarding.png"))),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30, right: 10),
              child: MyText.baseText(
                  text: 'MAKE YOUR HOME BEAUTIFUL',
                  color: colorLightBlack,
                  size: 42,
                  // fontWeight: FontWeight.w100,
                  fontFamily: 'PoppinsBold'),
            ),
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'The best simple place where you discover most wonderful furniture and make you home beautiful',
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     child: MyText.baseText(
            //       text:
            //           'The best simple place where you discover most wonderful furniture and make you home beautiful',
            //       color: colorGray,
            //     ),
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 650),
                          type: PageTransitionType.rightToLeft,
                          child: LogIn()));
                }),
                child: MyText.baseText(text: 'Get Started', color: colorWhite),
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff242424),
                    padding: EdgeInsets.only(top: 15, bottom: 15)),
              ),
            ),
          ],
        ));
  }
}
