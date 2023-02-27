import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/check_out.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../components/mytext.dart';
import '../models/myCart.dart';

class my_cart extends StatefulWidget {
  const my_cart({Key? key}) : super(key: key);

  @override
  State<my_cart> createState() => _my_cartState();
}

class _my_cartState extends State<my_cart> {

  double SumPrice =0;

  void sum(){
    setState(() {
      SumPrice= listMyCart.fold(0, (previousValue, element) => previousValue + (element.price * element.quantity));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sum();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
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
                            child: titleBar('My cart')
                          ),
                        ],

                    ),

                    Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: listMyCart.length,
                                itemBuilder: (context, index){
                                  final item = listMyCart[index];

                                  return Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.03),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 100,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(15),
                                                    child: Align(
                                                        alignment: Alignment.topCenter,
                                                        child: Image.asset(item.image,width: 100, height: 100, fit: BoxFit.cover,))),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 15, top: 4),
                                                  child: SizedBox(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        MyText.baseText(text: item.title),
                                                        Expanded(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 5),
                                                            child: MyText.baseText(
                                                                text: '\$ ${item.price * item.quantity}\0',
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: (){
                                                                setState(() {
                                                                  item.quantity++;
                                                                  sum();
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 30,
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(0xffE0E0E0),
                                                                    borderRadius: BorderRadius.circular(6)
                                                                ),
                                                                child: Center(child: Icon(Icons.add)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 14, right: 14),
                                                              child:  SizedBox(
                                                                width: 30,
                                                                height: 30,

                                                                child: Center(child: MyText.baseText(text: item.quantity.toString(), size: 18, fontWeight: FontWeight.bold)),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: (){
                                                                setState(() {
                                                                  if(item.quantity > 1){
                                                                   item.quantity--;
                                                                   sum();
                                                                  }
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 30,
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xffE0E0E0),
                                                                    borderRadius: BorderRadius.circular(6)
                                                                ),
                                                                child: Center(child: Icon(Icons.remove)),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                               GestureDetector(
                                                   onTap: (){
                                                     setState(() {
                                                       listMyCart.removeAt(index);
                                                     });
                                                   },
                                                     child:
                                                 Icon(Icons.cancel_outlined)),

                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 19),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                border:  Border(bottom: BorderSide(color: Colors.grey))),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter your promo code',
                                            contentPadding: EdgeInsets.only(left: 10, right: 10)
                                          ),
                                        ),
                                      ),
                                    ),

                                  Container(
                                      width: MediaQuery.of(context).size.height*0.07,
                                      height: MediaQuery.of(context).size.height*0.07,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: const Icon(Icons.arrow_forward_ios, color: Colors.white,))
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MyText.baseText(text: 'Total', size: 23, fontWeight: FontWeight.bold),),
                                  MyText.baseText(text: '\$ $SumPrice ', size: 23, fontWeight: FontWeight.bold)
                                ],
                              ),
                            ),

                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height*0.08,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, SwipeablePageRoute(builder: (context) => check_out()));
                                  },
                                  child:const Text('Check Out')),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
    );
  }


}

