import 'package:flutter/material.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/check_out.dart';

import '../components/mytext.dart';
import '../core/_config.dart';

class my_cart extends StatefulWidget {
  const my_cart({Key? key}) : super(key: key);

  @override
  State<my_cart> createState() => _my_cartState();
}

class _my_cartState extends State<my_cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
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

                    Container(
                      height: MediaQuery.of(context).size.height*0.57,
                        child: ListView.builder(
                          itemCount: listProduct.length,
                      itemBuilder: (context, index){
                        final item = listProduct[index];
                        return productFavorites(item.image, item.title, item.price);
                      },
                    ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child:const Card(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: ' Enter your promo code'
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Icon(Icons.arrow_forward_ios, color: Colors.white,))
                          ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyText.baseText(text: 'Total', size: 23, fontWeight: FontWeight.bold),),
                          MyText.baseText(text: '\$ 95.00', size: 23, fontWeight: FontWeight.bold)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => check_out()));
                          },
                          child:const Text('Check Out')),
                    )
                  ],
                ),
              ),
            ),

        ),
    );
  }
}

Widget productFavorites(String image, String title, double price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 19),
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 4),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.baseText(text: title, size: 14),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: MyText.baseText(
                                text: '\$ $price\0',
                                size: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xffE0E0E0),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: Center(child: Icon(Icons.add)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              child:  SizedBox(
                                width: 30,
                                height: 30,

                                child: Center(child: MyText.baseText(text: '01', size: 18, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xffE0E0E0),
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: Center(child: Icon(Icons.remove)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
                 const Icon(Icons.cancel_outlined)
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
}
