import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/LogIn.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../components/lineButton.dart';
import '../models/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? errorMesage ='';

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async{
    if( _controllerConfirmPassword.text == _controllerPassword.text){
      try{
      await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
      await Auth().savingUserData(name: _controllerName.text, password: _controllerPassword.text, ConfirmPassword: _controllerConfirmPassword.text, email: _controllerEmail.text);
      Navigator.pushNamedAndRemoveUntil(context, '/logIn2', (route) => false);
      print('------------------------------ok------------------------');
      }on FirebaseAuthException catch (e){
        setState(() {
          errorMesage = e.message;print('================' +e.toString());
          print('-------------------false-------------------');
        });
      }
    }else{
      print('false');
      setState(() {
        errorMesage = 'Confirm the password does not match the password';
      });
    }
  }
  

  Widget _errorMesage(){
    return Container(
      width: double.infinity,
      child: Center(
        child: MyText.baseText(text: errorMesage == '' ? '' : '$errorMesage',
        ),
      ),
    );
  }
  
  
  bool check = true;

  void _checkPasswordMatch() {
    if (_controllerPassword.text == _controllerConfirmPassword.text || _controllerConfirmPassword.text == null && _controllerPassword.text == null) {
      setState(() {
        check = true;
      });
    } else {
      setState(() {
        check = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [Header(), formSignUp(),
            _errorMesage(), lineButton(context)],
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

  Widget formSignUp({Color? color}) {
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
              _entryField(labelText: 'Name', obscureText: false, controller: _controllerName , border: Border.all(color: Colors.grey)),
              _entryField(labelText: 'Email', obscureText: false, controller: _controllerEmail, border: Border.all(color: Colors.grey)),
              _entryField(
                labelText: 'Password', 
                obscureText: false, 
                controller: _controllerPassword, 
                border: Border.all(color: Colors.grey),
                ),
              _entryField(
                labelText: 'Confirm Password', 
                obscureText: false, 
                controller: _controllerConfirmPassword, 
                border: Border.all(color: check? Colors.grey : Colors.red),
                 ),

              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                      createUserWithEmailAndPassword();
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
                    Navigator.pushNamedAndRemoveUntil(context, "/logIn2", (r) => false);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }

  Widget _entryField({ Function? onChanged,String? labelText, required bool obscureText, TextEditingController? controller, Border? border }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.015,
          bottom: MediaQuery.of(context).size.height * 0.015,
          left: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
          border:border,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: TextField(
              onChanged: (value) {
                _checkPasswordMatch();
              },
              controller: controller,
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
