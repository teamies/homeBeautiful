import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_beautiful/components/buttonBar.dart';
import 'package:home_beautiful/components/lineButton.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/Home.dart';
import 'package:home_beautiful/screens/SignUp.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: Column(
              children: [Header(), Expanded(child: formLogIn()), lineButton(context)],
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
      MyText.baseText(text: 'Hello!', fontWeight: FontWeight.w400, size: 30),
      Container(
        margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
        width: MediaQuery.of(context).size.width * 0.7,
        child: MyText.baseText(
            text: 'WELCOME BACK', size: 40, fontWeight: FontWeight.w700, maxLine: 1),
      )
    ]);
  }

  Widget formLogIn() {
    return Card(
      child: Container(
        // height: double.infinity*2/3,
        height: MediaQuery.of(context).size.height * 1 / 2,
        padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.height * 0.028,
              right: MediaQuery.of(context).size.height * 0.028),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            formTextField(labelText: 'Email', obscureText: false),
            formTextField(labelText: 'Password', obscureText: true),
            MyText.baseText(text: 'Forgot Password', color: colorGray),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, "/buttonBar", (r) => false);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => buttonBar(selectedIndex: 0,)));
                },
                child: MyText.baseText(text: 'Log in', color: colorWhite),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff242424),
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.02,),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ),
            GestureDetector(
              child: MyText.baseText(text: 'Sign Up', color: colorGray),
              onTap: () {
                Navigator.push(context,
                    SwipeablePageRoute(builder: (context) => SignUp()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget formTextField({String? labelText, required bool obscureText}) {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.all(8.0),
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01,
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
