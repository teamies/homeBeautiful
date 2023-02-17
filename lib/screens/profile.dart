import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/screens/my_reviews.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(child: MyText.baseText(text: 'Profile', fontWeight: FontWeight.bold)),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
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
                          MyText.baseText(text: 'Kristin Watson', fontWeight: FontWeight.bold),
                          MyText.baseText(text: 'bruno203@gmail.com', size: 14),
                        ],
                      ),
                    )

                  ],
                ),
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      list('My orders', 'Already have orders 10'),
                      list('Shipping Addresses','03 Adresses'),
                      list('Payment Method', 'You have 2 cards'),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => my_reviews() ));
                        },
                          child: list('My reviews', 'Reviews for 5 items')),
                      list('Setting', 'Notification, Password, FAQ, Contact')
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
  Widget list(String title, String text){
    return Container(
      height: 98,
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Padding(
          padding:  EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.baseText(text: title, fontWeight: FontWeight.bold),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: MyText.baseText(text: text, size: 14, color: colorGray),
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
}
