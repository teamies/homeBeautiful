import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home_beautiful/components/buttonBar.dart';
import 'package:home_beautiful/components/lineButton.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/Home.dart';
import 'package:home_beautiful/screens/Review.dart';
import 'package:home_beautiful/screens/my_cart.dart';
import 'package:home_beautiful/screens/product_favorites.dart';


class Product extends StatefulWidget {
  final product products;
  const Product({super.key, required this.products});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool check = true;
  bool checkcolorWhite = true;
  bool checkcolorBrown = false;
  bool checkcolorNude = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decreasecounter() {
    setState(() {
      _counter >0 ? _counter-- : _counter;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Header(),
                  contents( 
                    title: this.widget.products.title,
                    price: this.widget.products.price,
                    rate: 3.0,
                    sumEvaluate: '(50 reviews)',
                    content: this.widget.products.infPrp
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: lineButton(context),
            )

          ],
        ),
      ),
    );
  }

  Widget Header(){
    return Stack(
      // alignment: Alignment.centerLeft,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Hero(
              tag: 'heroImg',
              child: Container(
                width: MediaQuery.of(context).size.width*8/9,
                height: MediaQuery.of(context).size.height/2,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  // border: Border.all(),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                        alignment: Alignment.centerRight,
                        fit: BoxFit.cover,
                        image: AssetImage(this.widget.products.image))),
              ),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width*1/9)-25),
          // decoration: BoxDecoration(border: Border.all()),
          child: Column(
            children: [
              Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.only(top: 40,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
                child:GestureDetector(
                  child: Icon(Icons.chevron_left, size: 30),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),

              Container(
                height: 150,
                width: 50,
                margin: EdgeInsets.only(top: 50,),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xFFFFFFFF)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            checkcolorWhite =! checkcolorWhite;
                            checkcolorBrown = false;
                            checkcolorNude = false;
                          });
                        },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4,color: checkcolorWhite ? Colors.black : Color(0xFFF0F0F0)),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color(0xFFFFFFFF)),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            checkcolorBrown =! checkcolorBrown;
                            checkcolorWhite = false;
                            checkcolorNude = false;
                          });
                        },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: checkcolorBrown ?Colors.black : Color(0xFFF0F0F0)),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color(0xFFB4906C)),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            checkcolorNude =! checkcolorNude;
                            checkcolorWhite = false;
                            checkcolorBrown = false;
                          });
                        },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4,color: checkcolorNude ? Colors.black : Color(0xFFF0F0F0)),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color(0xFFE4CBAD)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget contents(
    {String? title, content,sumEvaluate,
    double? rate,price}){
    return  Container(
        // decoration: BoxDecoration(border: Border.all()),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.baseText(text: title!, size: 28, fontWeight: FontWeight.w400),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.baseText(text: '\$ $price\0', size: 30, fontWeight: FontWeight.w600),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _incrementCounter();
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Color(0xFFE0E0E0)  ),
                          child: Icon(Icons.add),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: MyText.baseText(text: '$_counter'),
                      ),

                       GestureDetector(
                        onTap: () {
                          setState(() {
                            _decreasecounter();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 40,
                          height: 40,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Color(0xFFE0E0E0)  ),
                          child: Icon(Icons.minimize_outlined),
                        ),
                      )
                    ],
                  )
                ],
              ),
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

            Container(
              padding: EdgeInsets.only(top: 10,bottom: 30),
              child: MyText.baseText(text: content, color: colorGray),
                  
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        check =! check;
                      });
                    },
                    child: Icon(Icons.bookmark_outline, color: check? Color(0xFF909090) : Colors.white,),
                    style: TextButton.styleFrom(
                      backgroundColor: check? Color(0xFFE0E0E0) : Colors.black,
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
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => my_cart()));
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
    );
  }
}