import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/LogIn.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../components/lineButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [Header(), formLogIn(), lineButton(context)],
          ),
        ),
      ),
    );
  }

  Widget Header() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            ),
          ),
          Container(
              // decoration: BoxDecoration(border: Border.all()),
              margin: EdgeInsets.only(
                  top: 30,
                  bottom: MediaQuery.of(context).size.height * 0.03,
                  left: 20,
                  right: 20),
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/MinimalStand.png'),
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            ),
          ),
        ],
      ),
      Container(
        margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
        width: MediaQuery.of(context).size.width / 2,
        child: MyText.baseText(
            text: 'WELCOME', size: 40, maxLine: 1, fontWeight: FontWeight.w700),
      )
    ]);
  }

  Widget formLogIn() {
    return 
       Card(
        child: Container(
          // height: double.infinity*2/3,
          height: MediaQuery.of(context).size.height * 4 / 5,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.height * 0.028,
              right: MediaQuery.of(context).size.height * 0.028),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              formTextField(labelText: 'Name', obscureText: false),
              formTextField(labelText: 'Email', obscureText: true),
              formTextField(labelText: 'Password', obscureText: true),
              formTextField(labelText: 'Confirm Password', obscureText: true),
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/logIn", (r) => false);
                    // Navigator.push(
                    //     context,
                    //     SwipeablePageRoute(
                    //         transitionBuilder: (context,
                    //                 animation,
                    //                 secondaryAnimation,
                    //                 isSwipeGesture,
                    //                 child) =>
                    //             LogIn(),
                    //         builder: (context) => LogIn()));
                  },
                  child: MyText.baseText(text: 'Sign up', color: colorWhite),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff242424),
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.02,),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText.baseText(
                      text: 'Already have account?', color: colorGray),
                  GestureDetector(
                    child: MyText.baseText(text: 'Sign in'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }

  Widget formTextField({String? labelText, required bool obscureText}) {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.all(8.0),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.015,
          bottom: MediaQuery.of(context).size.height * 0.015,
          left: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: TextField(
              style: MyText.textStyle(),
              cursorColor: Colors.black,
              cursorHeight: 25,
              obscureText: obscureText,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(8),
                  fillColor: Colors.black,
                  labelText: labelText,
                  labelStyle: MyText.textStyle(color: colorGray)),
            ),
          ),
          Expanded(
              flex: 1,
              child: FaIcon(
                FontAwesomeIcons.chevronDown,
                size: 18,
              ))
        ],
      ),
    );
  }
}
