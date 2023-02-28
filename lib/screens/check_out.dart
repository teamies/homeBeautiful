import 'package:flutter/material.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/screens/congrats.dart';
import 'package:home_beautiful/screens/my_cart.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../components/mytext.dart';
import '../core/_config.dart';

class check_out extends StatefulWidget {
  const check_out({super.key, required this.SumPrice});
  final double SumPrice;
  @override
  State<check_out> createState() => _check_outState();
}

class _check_outState extends State<check_out> {
  double Delivery = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                     Expanded(
                       child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios),
                                color: Colors.black,
                              ),
                            ),
                            Expanded(flex: 20, child: titleBar('Check Out')),
                          ],
                        ),
                     ),


                   Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          edit('Shipping address'),

                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.baseText(
                                      text: 'Bruno Fernandes',
                                      fontWeight: FontWeight.bold),
                                  Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom:
                                                BorderSide(color: Colors.grey))),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: MyText.baseText(
                                        text:
                                            '25 rue Rober Latouche, Nice, 06200, Côte D\'azur France',
                                        color: colorGray),
                                  )
                                ],
                              ),
                            ),
                          ),
                          edit('Payment'),

                          Container(
                            height: MediaQuery.of(context).size.height*0.1,
                            child: Card(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/img/card.png'),
                                        MyText.baseText(
                                            text: '**** **** **** 3947',
                                            fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          edit('Delivery method'),

                          Container(
                            height: MediaQuery.of(context).size.height*0.01,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/img/dhl.png'),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: MyText.baseText(
                                          text: 'Fast (2-3 days)',
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                           Card(
                             margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.01),
                              child: Column(
                                children: [
                                  price('Order', this.widget.SumPrice, FontWeight.normal),
                                  price('Delivery', Delivery, FontWeight.normal),
                                  price('Total', this.widget.SumPrice+ Delivery, FontWeight.bold),
                                ],
                              ),
                            ),

                        ],
                      ),
                    
                  ],
                ),
              ),


              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.08,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          SwipeablePageRoute(builder: (context) => congrats()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    child: MyText.baseText(
                        text: 'Submit order', color: colorWhite)),
              )
            ],
          )),
    ));
  }

  Widget edit(String text) {
    return  Container(
      height: MediaQuery.of(context).size.height*0.09,
        child: Row(
          children: [
            Expanded(
                child: MyText.baseText(
                    text: text, color: colorGray, fontWeight: FontWeight.bold)),
            Container(
                decoration:
                    const BoxDecoration(border: Border(bottom: BorderSide())),
                child: Icon(Icons.edit_outlined))
          ],

      ),
    );
  }

  Widget price(String text, double price, FontWeight bold) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
      child: Container(
          height: MediaQuery.of(context).size.height*0.05,
          child: Row(
            children: [
              Expanded(
                  child: MyText.baseText(
                      text: text, color: colorGray, fontWeight: FontWeight.bold)),
              MyText.baseText(text: '\$ $price', fontWeight: bold)
            ],

        ),
      ),
    );
  }
}
