import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/LogIn.dart';
import 'package:home_beautiful/screens/SignUp.dart';

import '../components/buttonBar.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.all(50),
          child: Column(
            children: [
              Header(),
              formLogIn(context)],
          ),
        ),
      ),

    );
  }

  Widget Header() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          child: Image(image: AssetImage("assets/img/Logo.png"))),
      MyText.baseText(text: 'Hello!', fontWeight: FontWeight.w400, size: 30),
      MyText.baseText(
          text: 'WELCOME BACK', size: 40, fontWeight: FontWeight.w700)
    ]);
  }

  Widget formLogIn(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Container(
          // height: double.infinity*2/3,
          height: MediaQuery.of(context).size.height*3/5,
          padding: EdgeInsets.only(top: 50, bottom: 50, left: 28, right: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              formTextField(
                  labelText: 'Name',
                  obscureText: false
              ),
              formTextField(
                  labelText: 'Email',
                  obscureText: true
              ),
              formTextField(
                  labelText: 'Password',
                  obscureText: true
              ),
              formTextField(
                  labelText: 'Confirm Password',
                  obscureText: true
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LogIn()));
                  },
                  child: MyText.baseText(text: 'Sing up', color: colorWhite),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff242424),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText.baseText(text:'Already have account?', color: colorGray),
                  GestureDetector(
                    child: MyText.baseText(text: 'Sign in' ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget formTextField({String? labelText, required bool obscureText}) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
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
            Expanded(flex: 1, child: FaIcon(FontAwesomeIcons.chevronDown, size: 18,))
          ],
        ),
      ),
    );
  }
  }


