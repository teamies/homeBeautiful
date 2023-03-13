import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/my_reviews.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../models/auth_service.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  
  Future<dynamic> signOut() async {
    await Auth().signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/Boarding', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          child: Column(
            children: [
              titleBar('Profile'),
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 80, minHeight: 50),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/img/img.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.baseText(
                            text: 'Kristin Watson',
                            fontWeight: FontWeight.bold),
                        MyText.baseText(text: 'bruno203@gmail.com', size: 14),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          list('My orders', 'Already have orders 10'),
                          list('Shipping Addresses', '03 Adresses'),
                          list('Payment Method', 'You have 2 cards'),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    SwipeablePageRoute(
                                        builder: (context) => my_reviews()));
                              },
                              child: list('My reviews', 'Reviews for 5 items')),
                          list('Setting', 'Notification, Password, FAQ, Contact'),
                          LogOut()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget list(String title, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.baseText(text: title, fontWeight: FontWeight.bold),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.001),
                      child: MyText.baseText(
                          text: text, size: 14, color: colorGray),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      ),
    );
  }

  Widget LogOut() {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          signOut();
        },
        child: MyText.baseText(text: 'Log Out', color: colorWhite),
        style: TextButton.styleFrom(
          backgroundColor: Color(0xff242424),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.02,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    );
  }
}
