import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.all(50),
      child: Column(
        children: [
          Header(),formLogIn()
        ],
      ),
    ),
    );
  }

  Widget Header (){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          child: Image(image: AssetImage("assets/img/Logo.png"))),
        MyText.baseText(text: 'Hello!', fontWeight: FontWeight.w400,size: 30 ),
        MyText.baseText(text: 'WELCOME BACK', size: 40, fontWeight: FontWeight.w700)
      ]
    );
  }

  Widget formLogIn (){
    return Container(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: [
            TextField(
              // onChanged: (value) {
              //   if (value.length > 3) {
              //     setState(() {
              //       _results = value;
              //     });
              //   }
              // },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.black,
                  labelText: 'Email',
                  hintText: 'Vị trí',
                  hintStyle: TextStyle(color: Colors.black)),
            ),

            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.black,
                  hintText: 'Vị trí',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            
          ],
        ),
      ),
    );
  }
}