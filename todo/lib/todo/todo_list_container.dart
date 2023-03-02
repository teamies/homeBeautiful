import 'package:flutter/material.dart';

class buidHeader extends StatefulWidget {
  const buidHeader({Key? key}) : super(key: key);

  @override
  State<buidHeader> createState() => _buidHeaderState();
}

class _buidHeaderState extends State<buidHeader> {
  var txtTodoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: InputDecoration(
                labelText: 'Add todo',
                hintText: 'Add todo'
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: (){},
          icon: Icon(Icons.add), label: Text('Add'),)
      ],
    );
  }
}

