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
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
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
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, minHeight: 80),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(image,width: 100, height: 100, fit: BoxFit.cover,))),
              ),

              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.09),
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
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.11, left: MediaQuery.of(context).size.width*0.5),
                          child: Text(
                            type,
                            style: TextStyle(color: Color(int.parse(color))),
                          ))
                    ])),
              ),
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
