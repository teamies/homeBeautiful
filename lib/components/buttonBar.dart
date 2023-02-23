import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../screens/Home.dart';
import '../screens/notification.dart';
import '../screens/product_favorites.dart';
import '../screens/profile.dart';

class buttonBar extends StatefulWidget {
  const buttonBar({super.key});

  @override
  State<buttonBar> createState() => _buttonBarState();
}

class _buttonBarState extends State<buttonBar> {
  int _selectedIndex = 0;
  List tap = [Home(), product_favorites(), notification(), profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 600),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: tap[_selectedIndex],
      ) ,
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