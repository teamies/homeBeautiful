import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home_beautiful/components/buttonBar.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/Review.dart';

class aa extends StatelessWidget {
  const aa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class Product extends StatelessWidget {
  const Product({super.key, required this.pro}) ;
  final product pro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Header(context),
            contents(context,
              title: pro.title,
              price: pro.price,
              rate: 3.0,
              sumEvaluate: '(50 reviews)',
              content: 'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price'
            )

          ],
        ),
      ),
    );
  }

  Widget Header(BuildContext context){
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*8/9,
              height: MediaQuery.of(context).size.height/2,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  fit: BoxFit.cover,
                  image: AssetImage(pro.image))),
            ),
          ],
        ),

        Column(
          children: [
            Container(
              height: 35,
              width: 35,
              margin: EdgeInsets.only(top: 50, left: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
              child:GestureDetector(
                child: Icon(Icons.chevron_left, size: 30),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => buttonBar()));
                },
              ),
            ),

            Container(
              height: 150,
              width: 50,
              margin: EdgeInsets.only(top: 50, left: 30),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color(0xFFFFFFFF)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4) ,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0xFFFFFFFF)),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Color(0xFFF0F0F0)) ,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0xFFB4906C)),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4,color: Color(0xFFF0F0F0)) ,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0xFFE4CBAD)),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget contents( BuildContext context,
    {String? title, content,sumEvaluate,
    double? rate,price}){
    return Expanded(
      child: Container(
        // decoration: BoxDecoration(border: Border.all()),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.baseText(text: title!, size: 28, fontWeight: FontWeight.w400),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.baseText(text: '\$ $price\0', size: 30, fontWeight: FontWeight.w600),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        color: Color(0xFFE0E0E0)  ),
                      child: Icon(Icons.add),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: MyText.baseText(text: '01'),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 40,
                      height: 40,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        color: Color(0xFFE0E0E0)  ),
                      child: Icon(Icons.minimize_outlined),
                    )
                  ],
                )
              ],
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Review()));
              },
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 15),
                    child: MyText.baseText(text: '$rate'),
                  ),
                  MyText.baseText(text: sumEvaluate)
                ],
              ),
            ),

            MyText.baseText(text: content, color: colorGray),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                    },
                    child: Icon(Icons.bookmark_outline, color: Color(0xFF909090),),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFE0E0E0),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ),
                
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 5,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context, MaterialPageRoute(builder: (context) => buttonBar()));
                    },
                    child: MyText.baseText(text: 'Add to cart', color: colorWhite),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff242424),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}