import 'package:flutter/material.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/screens/congrats.dart';

import '../components/mytext.dart';
import '../core/_config.dart';

class check_out extends StatefulWidget {
  const check_out({Key? key}) : super(key: key);

  @override
  State<check_out> createState() => _check_outState();
}

class _check_outState extends State<check_out> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(child:
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon:const Icon(Icons.arrow_back_ios),
                              color: Colors.black,
                            ),
                          ),

                        Expanded(
                          flex: 20,
                          child: titleBar('Check Out')
                        ),
                      ],
                    ),
                    edit('Shipping address'),

                    Card(
                      child: Padding(
                        padding:  EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.baseText(text: 'Bruno Fernandes', size: 25, fontWeight: FontWeight.bold),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              decoration:const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey
                                      )
                                  )
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 10, bottom: 10),
                              child: MyText.baseText(text: '25 rue Rober Latouche, Nice, 06200, Côte D\'azur France',size: 15 ,color: colorGray),
                            )

                          ],
                        ),
                      ),
                    ),

                    edit('Payment'),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.08,
                      child: Card(
                        child: Padding(
                            padding:  EdgeInsets.all(8),
                            child:Center(
                              child: Row(
                                children: [
                                  Image.asset('assets/img/card.png'),
                                  MyText.baseText(text: '**** **** **** 3947', fontWeight: FontWeight.bold),

                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    edit('Delivery method'),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.08,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset('assets/img/dhl.png'),
                              Padding(
                                padding:  EdgeInsets.only(left: 20),
                                child: MyText.baseText(text: 'Fast (2-3 days)', fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Card(
                        child: Column(
                          children: [
                            price('Order', '95.00', FontWeight.normal),
                            price('Delivery', '5.00', FontWeight.normal),
                            price('Total', '100.00', FontWeight.bold),
                          ],
                        ),
                      ),
                    )


                  ],
                ),),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => congrats()));
                  },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black)
                      ),
                      child: MyText.baseText(text: 'Submit order', color: colorWhite)),
                )
              ],
            )
          ),
        ));
  }
  Widget edit(String text){
    return Padding(
      padding:  EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          Expanded(child: MyText.baseText(text: text, color: colorGray, fontWeight: FontWeight.bold)),
          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                      )
                  )
              ),
              child: Icon(Icons.edit_outlined))
        ],
      ),
    );
  }

  Widget price(String text, String price, FontWeight bold){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: MyText.baseText(text:text, color: colorGray, fontWeight: FontWeight.bold)),
          MyText.baseText(text: '\$ $price', fontWeight: bold)
        ],
      ),
    );
  }
}

