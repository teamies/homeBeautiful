import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({Key? key}) : super(key: key);

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('todo'),
            trailing: GestureDetector(
              onTap: (){
                print('ada');
              },
              child: Icon(Icons.delete, color: Colors.red,),
            ),
          );
        });
  }
}
