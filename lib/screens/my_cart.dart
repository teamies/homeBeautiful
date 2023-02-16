import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Center(
                            child: MyText.baseText(
                                text: 'My cart',
                                size: 20,
                                color: colorBlack,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height*0.57,
                    child: ListView(
                  children: [
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                      productFavorites(),
                  ],
                ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '  Enter your promo code'
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
                            child: Icon(Icons.arrow_forward_ios, color: Colors.white,))
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
                      onPressed: () {},
                      child: Text('Check Out')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget productFavorites() {
  return Padding(
    padding: EdgeInsets.only(top: 19),
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
                      image: AssetImage('assets/img/table.png'),
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
                        MyText.baseText(text: 'Minimal Stand', size: 14),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: MyText.baseText(
                                text: '\$ 25.00',
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
                                color: Color(0xffE0E0E0),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: Center(child: Icon(Icons.add)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              child: Container(
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
                  Icon(Icons.cancel_outlined)
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
