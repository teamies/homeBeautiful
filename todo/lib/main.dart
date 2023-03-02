import 'package:flutter/material.dart';
import 'package:todo/todo/todo_list.dart';
import 'package:todo/todo/todo_list_container.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            buidHeader(),
            Expanded(child: Todolist())
          ],
        ),
      ),
    );
  }
}



