import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/models/notificationModel.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              titleBar('Notification'),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    child: ListView.builder(
                      itemCount: listNotification.length,
                      itemBuilder: (context, index) {
                        final item = listNotification[index];
                        return product(item.image, item.title, item.comment,
                            item.type, item.color);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget product(
      String image, String title, String comment, String type, String color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        children: [
                          MyText.baseText(
                              text: title,
                              size: 14,
                              fontWeight: FontWeight.bold),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: MyText.baseText(text: comment, size: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 80, left: 200),
                        child: Text(
                          type,
                          style: TextStyle(color: Color(int.parse(color))),
                        ))
                  ])),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
          ),
        )
      ],
    );
  }
}
