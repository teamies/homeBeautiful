
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_beautiful/components/buttonBar.dart';
import 'package:home_beautiful/models/auth_service.dart';
import 'package:home_beautiful/screens/Home.dart';
import 'package:home_beautiful/screens/LogIn.dart';

class treeScreen extends StatefulWidget {
  const treeScreen({super.key});

  @override
  State<treeScreen> createState() => _treeScreenState();
}

class _treeScreenState extends State<treeScreen> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return buttonBar(selectedIndex: 0);
        }else{
          return LogIn(title: 'WELCOME');
        }
      },
    );
  }
}