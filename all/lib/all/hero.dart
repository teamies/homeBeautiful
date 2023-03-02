import 'package:flutter/material.dart';

class hero extends StatefulWidget {
  const hero({Key? key}) : super(key: key);

  @override
  State<hero> createState() => _heroState();
}

class _heroState extends State<hero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
        trailing: Hero(
          tag: 'tag 1',
          child: Icon(Icons.access_time),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => hero2()));
        },
      ),
    );
  }
}

class hero2 extends StatefulWidget {
  const hero2({Key? key}) : super(key: key);

  @override
  State<hero2> createState() => _hero2State();
}

class _hero2State extends State<hero2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'tag 1',
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        ),
      )
    );
  }
}
