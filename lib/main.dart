import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_beautiful/components/buttonBar.dart';
import 'package:home_beautiful/screens/LogIn.dart';
import 'package:home_beautiful/screens/SignUp.dart';
import 'firebase_options.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      home(),
       routes: <String, WidgetBuilder> {
      '/signUp': (context) => SignUp(),
      '/logIn': (context) => LogIn(),
      '/buttonBar': (context) => buttonBar(selectedIndex: 0,),
    },
    );
  }
}