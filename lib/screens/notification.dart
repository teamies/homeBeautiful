import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/components/titleBar.dart';
import 'package:home_beautiful/models/databaseManage.dart';

import '../models/order.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  List<order> listOrder = [];
 // StreamSubscription<List<order>>? streamSubscription ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // streamSubscription = databaseManage().getOrder().listen((event) {
     //   setState(() {
     //     listOrder = event;
     //   });
     //   print(event);
     //   print(listOrder);
     // });
    order1();

    print (listOrder);

  }

  order1() async{
    dynamic res = await databaseManage().getOrder();
    if(res != null){
      setState(() {
        listOrder = res;
      });
      print(res);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
          child: Column(
            children: [
              titleBar('Notification'),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    child: StreamBuilder(
                      stream: databaseManage().getOrder(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                               final item = snapshot.data![index];

                              return Text(item.idOrder.toString());
                                // product(item.idOrder.toString(), item.products[index].image);
                            },
                          );
                        }
                        else{
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget product(String idOrder,
      String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, minHeight: 80),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: NetworkImage(image)
                  )
                ),
              ),

              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.09),
                    child: Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          children: [
                            MyText.baseText(
                                text: 'Your order $idOrder has been confirmed',
                                size: 14,
                                fontWeight: FontWeight.bold),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: MyText.baseText(text: 'Lorem ipsum dolor sit amet', size: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.11, left: MediaQuery.of(context).size.width*0.5),
                          child:  Text(
                            'New',
                            style: TextStyle(color: Color(0xff27AE60),)
                          ))
                    ])),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
          ),
        )
      ],
    );
  }
}
