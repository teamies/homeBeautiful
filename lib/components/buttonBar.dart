

import 'package:flutter/material.dart';
import 'package:home_beautiful/screens/Home.dart';
import 'package:home_beautiful/screens/LogIn.dart';

class buttonBar extends StatefulWidget {
  const buttonBar({super.key});

  @override
  State<buttonBar> createState() => _buttonBarState();
}

class _buttonBarState extends State<buttonBar> {
  int _selectedIndex = 0;
  List tap = [Home(), LogIn(), Home(), Home()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tap[_selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'aa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
            ),
            label: 'aa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none,
            ),
            label: 'aa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'aa',
            // backgroundColor: Colors.black
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}