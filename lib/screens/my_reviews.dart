import 'package:flutter/material.dart';

import '../components/mytext.dart';
import '../core/_config.dart';
import '../models/myReview.dart';

class my_reviews extends StatefulWidget {
  const my_reviews({Key? key}) : super(key: key);

  @override
  State<my_reviews> createState() => _my_reviewsState();
}

class _my_reviewsState extends State<my_reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon:const Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Center(
                        child: MyText.baseText(
                            text: 'My reviews',
                            size: 20,
                            color: colorBlack,
                            fontWeight: FontWeight.bold)),
                  ),
                ],

              ),

              Expanded(
                  child: ListView.builder(
                    itemCount: listMyReview.length,
                      itemBuilder: (context, index){
                      final item = listMyReview[index];
                        return listReview(item.image, item.title, item.price, item.comment);
                      }))
            ],
          ),
        ),
      ),
    );
  }
  Widget listReview(String image, String title, double price, String comment){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        child: Container(
          width: 357,
          height: 252,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image)
                      ),
                      borderRadius: BorderRadius.circular(9)
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 14),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         MyText.baseText(text: title),
                         Padding(
                           padding: const EdgeInsets.only(top: 5),
                           child: MyText.baseText(text: '\$ $price\0', fontWeight: FontWeight.bold),
                         )
                       ],
                     ),
                   )
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        )),
                    MyText.baseText(text: '19/2/2023', size: 12, color: colorGray, fontWeight: FontWeight.bold)
                  ],
                ),
              ),
                MyText.baseText(text: comment, size: 13, color: colorGray),

            ],
          ),
        ),
      ),
    );
  }
}
