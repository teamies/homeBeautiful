import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_beautiful/components/buttonBar.dart';
import 'package:home_beautiful/components/lineButton.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/components/notification.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/models/favorites.dart';
import 'package:home_beautiful/models/cart.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/Home.dart';
import 'package:home_beautiful/screens/Review.dart';
import 'package:home_beautiful/screens/my_cart.dart';
import 'package:home_beautiful/screens/product_favorites.dart';

import '../models/databaseManage.dart';


class Product extends StatefulWidget {
  final product products;
  const Product({super.key, required this.products});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool checkcolorWhite = true;
  bool checkcolorBrown = false;
  bool checkcolorNude = false;
  num _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decreasecounter() {
    setState(() {
      _counter >1 ? _counter-- : _counter;
    });
  }

  List<cart> listCart = [];
  StreamSubscription<List<cart>>? streamSubscription;
  late String name;
  late String content;
  late String image;
  late num price;
  late String type;
  late num quatity;
  late num star;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription = databaseManage().getCart().listen((event) {
      setState(() {
        listCart = event;
      });
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
                    title: this.widget.products.name,
                    price: this.widget.products.price,
                    rate: this.widget.products.star,
                    sumEvaluate: '(50 reviews)',
                    content: this.widget.products.content
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
                        image: NetworkImage(this.widget.products.image))),
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
    num? rate,price}){
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
                  MyText.baseText(text: '\$ $price', size: 30, fontWeight: FontWeight.w600),
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
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Review()));
              },
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 15),
                    child: MyText.baseText(text: rate!.toString()),
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

                        this.widget.products.favorite =! this.widget.products.favorite;
                        Map<String, dynamic> data ={
                          'content': this.widget.products.content,
                          'price': this.widget.products.price,
                          'type': this.widget.products.type,
                          'star': this.widget.products.star,
                          'quantity': this.widget.products.quantity,
                          'image': this.widget.products.image,
                          'name': this.widget.products.name,
                          'favorite': this.widget.products.favorite};
                        databaseManage().updateProduct(this.widget.products.idProduct.toString(), data);

                      });
                    },
                    child: Icon(Icons.bookmark_outline, color: this.widget.products.favorite == true ? Colors.white : Color(0xFF909090)),
                    style: TextButton.styleFrom(
                      backgroundColor: this.widget.products.favorite == true ? Colors.black: Color(0xFFE0E0E0),
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
                        setState(() {
                          bool check = false;
                          if(listCart.length <= 1 )
                          {
                            databaseManage().createCart(cart(
                                idProduct: this.widget.products.idProduct.toString(),
                                quantity: 1));
                          }
                          else{
                            for (int i = 0; i < listCart.length; i++) {
                              if (this.widget.products.idProduct == listCart[i].idProduct) {
                                Map<String, dynamic> data = {
                                  'idProduct': listCart[i].idProduct,
                                  'quantity': listCart[i].quantity + 1
                                };
                                databaseManage()
                                    .updateCart(listCart[i].id.toString(), data);
                                check = true;
                                break;
                              }

                            }
                            if(!check){
                              databaseManage().createCart(cart(
                                  idProduct: this.widget.products.idProduct.toString(),
                                  quantity: 1));
                            }
                          }



                          notification.onAdd(context);
                        });
                      },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff242424),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),

    child: MyText.baseText(text: 'Add to cart', color: colorWhite),
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}