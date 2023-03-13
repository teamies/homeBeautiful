
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_beautiful/components/notification.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/models/databaseManage.dart';
import 'package:home_beautiful/screens/check_out.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../components/mytext.dart';
import '../models/cart.dart';


class my_cart extends StatefulWidget {
  const my_cart({Key? key}) : super(key: key);

  @override
  State<my_cart> createState() => _my_cartState();
}

class _my_cartState extends State<my_cart> {
   num SumPrice = 0;
  List<cart> listMyCart = [];
  StreamSubscription<List<cart>>? streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   streamSubscription = databaseManage().getCart().listen((event) {
     setState(() {
       listMyCart = event;
       SumPrice = sum();
     });
   });
  }


  num sum(){
    return
      SumPrice = listMyCart.fold(0, (previousValue, element) => previousValue + (element.price! * element.quantity));
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
                              child:
                              StreamBuilder(
                                stream: databaseManage().getCart(),
                                builder: (context, snapshot){
                                  if(snapshot.hasData){
                                    return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index){
                                        final item = snapshot.data![index];
                                        return productMyCart(item, index);
                                      },
                                    );
                                  }
                                  else{
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              )
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                children: [
                                const  Expanded(
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
                                    if(SumPrice >0){
                                      Navigator.push(context, SwipeablePageRoute(builder: (context) => check_out(SumPrice: SumPrice,)));
                                    }
                                    else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Vui lòng thêm sản phẩm vào giỏ hàng'),
                                        duration: Duration(seconds: 1),)
                                      );
                                    }
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

  Widget productMyCart(final item,int index){
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: NetworkImage(item.image)
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.09, top: 4),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.baseText(text: item.name),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: MyText.baseText(
                                    text: '\$ ${item.price}',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      item.quantity ++;
                                      sum();
                                      Map<String, dynamic> data = {
                                        'idProduct': item.idProduct,
                                        'quantity': item.quantity
                                      };
                                      databaseManage().updateCart(item.id.toString(), data);
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
                                        item.quantity --;
                                        sum();
                                        Map<String, dynamic> data = {
                                          'idProduct': item.idProduct,
                                          'quantity': item.quantity
                                        };
                                        databaseManage().updateCart(item.id.toString(), data);

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
                          databaseManage().deleteCart(item.id);
                          listMyCart.removeAt(index);
                          sum();
                          notification.onDelete(context);
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

  }


}

