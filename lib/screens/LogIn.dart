import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_beautiful/models/auth_service.dart';
import 'package:home_beautiful/models/user.dart';
import 'package:home_beautiful/screens/ForgotPassword.dart';
import 'package:home_beautiful/screens/Home.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../components/lineButton.dart';
import '../components/mytext.dart';
import '../core/_config.dart';
import 'SignUp.dart';

class LogIn extends StatefulWidget {
  String title;
  LogIn({super.key, required this.title});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  List<Users> listUser = [];
  StreamSubscription<List<Users>>? streamSubscription;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription = Auth().getUser().listen((event) {
      setState(() {
        listUser = event;
      });
    });
  }
  String? errorMesage = '';
  // bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<dynamic> signInWithEmailAndPassword() async {
    
    try {
      for(int i =0; i <= listUser.length; i++){
        if(listUser[i].id == _controllerEmail.text){
          Auth().updatePassword(uid: _controllerEmail.text, password: _controllerPassword.text, ConfirmPassword: _controllerPassword.text);
          print('------------------------update-------------- ');
        }else{print('---------------------no update-------------------------------');}
      }
      
      // Auth().updatePassword(uid: _controllerEmail.text, password: _controllerPassword.text, ConfirmPassword: _controllerPassword.text);
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      Navigator.pushNamedAndRemoveUntil(
          context, '/buttonBar', (route) => false);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMesage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMesage = e.message;
      });
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
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
            child: TextFormField(
              controller: controller,
              style: MyText.textStyle(),
              cursorColor: Colors.black,
              cursorHeight: 25,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(8),
                  fillColor: Colors.black,
                  labelText: title,
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

  Widget _errorMesage() {
    return Text(errorMesage == '' ? '' : '$errorMesage');
  }

  Widget _submitButton() {
    return TextButton(
        onPressed: () {
          signInWithEmailAndPassword();
        },
        child: Text('Login'));
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
            textAlign: TextAlign.center,
            text: widget.title,
            size: 40,
            fontWeight: FontWeight.w700,
            maxLine: 1),
      )
    ]);
  }

  Widget formLogIn() {
    return Card(
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.height * 0.028,
            right: MediaQuery.of(context).size.height * 0.028),
        child: Column(
          children: [
            _entryField('email', _controllerEmail),
            SizedBox(
              height: 25,
            ),
            _entryField('password', _controllerPassword),
            _errorMesage(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MyText.baseText(text: 'Forgot Password', color: colorGray),
              ),
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  signInWithEmailAndPassword();
                },
                child: MyText.baseText(text: 'Log in', color: colorWhite),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff242424),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                child: MyText.baseText(text: 'Sign Up', color: colorGray),
                onTap: () {
                  Navigator.push(context,
                      SwipeablePageRoute(builder: (context) => SignUp()));
                  // _signIn();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Header(), formLogIn(),
                  //  _loginRegisterButton(),
                  lineButton(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
