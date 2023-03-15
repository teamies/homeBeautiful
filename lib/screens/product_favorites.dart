import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/components/notification.dart';
import 'package:home_beautiful/models/databaseManage.dart';
import 'package:home_beautiful/models/cart.dart';
import 'package:home_beautiful/models/product.dart';

import '../components/titleBar.dart';

class product_favorites extends StatefulWidget {
  const product_favorites({Key? key}) : super(key: key);

  @override
  State<product_favorites> createState() => _product_favoritesState();
}

class _product_favoritesState extends State<product_favorites> {
  List<product> listProduct = [];
  List<cart> listCart = [];
  StreamSubscription<List<product>>? streamSubscriptionProduct;
  StreamSubscription<List<cart>>? streamSubscriptionCart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscriptionProduct = databaseManage().getProduct().listen((event) {
      setState(() {
        listProduct = event;
      });
    });
    streamSubscriptionCart = databaseManage().getCart().listen((event) {
      setState(() {
        listCart = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: Column(
              children: [
                titleBar('Favorites'),
                Expanded(
                    child:
                    StreamBuilder(
                      stream: databaseManage().getProduct(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                         return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              final item = snapshot.data![index];
                              if (item.favorite == true) {
                                return productFavorites(item, index);
                              } else {
                                return Container();
                              }
                            },
                          );
                        }
                        else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
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
                        setState(() {
                          setState(() {
                            bool check = false;
                            for(int j =0; j<listProduct.length; j++){
                              final item = listProduct[j];
                              if(item.favorite == true){
                                if(listCart.length <= 1 )
                                {
                                  databaseManage().createCart(cart(
                                      idProduct: item.idProduct.toString(),
                                      quantity: 1));
                                }
                                else{
                                  for (int i = 0; i < listCart.length; i++) {
                                    if (item.idProduct == listCart[i].idProduct) {
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
                                        idProduct: item.idProduct.toString(),
                                        quantity: 1));
                                  }
                                }

                                notification.onAdd(context);
                              }

                            }
                          });
                        });
                        notification.onAdd(context);
                        //Navigator.push(context, SwipeablePageRoute(builder: (context) => my_cart()));
                      },
                      child: const Text('Add all to my cart')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productFavorites(final item, int index) {
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: NetworkImage(item.image)
                    )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 4),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.baseText(text: item.name),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: MyText.baseText(
                                text: '\$ ${item.price}',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            bool check = false;
                            Map<String, dynamic> data = {
                              'content': item.content,
                              'price': item.price,
                              'type': item.type,
                              'star': item.star,
                              'quantity': item.quantity,
                              'image': item.image,
                              'name': item.name,
                              'favorite': check
                            };
                            databaseManage()
                                .updateProduct(item.idProduct, data);
                               listProduct.removeAt(index);
                               notification.onDelete(context);
                          });
                        },
                        child: Icon(Icons.cancel_outlined)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          bool check = false;
                          if(listCart.length <= 1 )
                          {
                            databaseManage().createCart(cart(
                                idProduct: item.idProduct.toString(),
                                quantity: 1));
                          }
                          else{
                            for (int i = 0; i < listCart.length; i++) {
                              if (item.idProduct == listCart[i].idProduct) {
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
                                  idProduct: item.idProduct.toString(),
                                  quantity: 1));
                            }
                          }

                          notification.onAdd(context);
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(4)),
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
          Padding(
            padding: EdgeInsets.only(top: 19),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
            ),
          )
        ],
      ),
    );
  }
}
