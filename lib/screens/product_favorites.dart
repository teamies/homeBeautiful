import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/screens/my_cart.dart';

import '../core/_config.dart';

class product_favorites extends StatefulWidget {
  const product_favorites({Key? key}) : super(key: key);

  @override
  State<product_favorites> createState() => _product_favoritesState();
}

class _product_favoritesState extends State<product_favorites> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 20),
                  child: MyText.baseText(text: 'Favorites', size: 20, color: colorBlack, fontWeight: FontWeight.bold),
                )),
                Expanded(
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
                    )),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => my_cart()));
                      },
                      child: Text('Add all to my cart')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget productFavorites(){
  return Padding(
    padding:  EdgeInsets.only(top: 19),
    child: Column(
      children: [
        Container(
          height:100,
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
                  borderRadius: BorderRadius.circular(10)
                ),

              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:15, top: 4),
                  child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.baseText(text:'Minimal Stand', size: 14),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: MyText.baseText(text: '\$ 25.00', size: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                      ),
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.cancel_outlined),

                      Padding(
                        padding: const EdgeInsets.only(top: 44),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Center(
                            child: Icon(Icons.shopping_bag),
                          ),
                        ),
                      ),

                    ],
                  )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 19),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey
                )
              )
            ),
          ),
        )
      ],
    ),
  );
}