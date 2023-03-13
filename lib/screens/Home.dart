import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/models/databaseManage.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/Product.dart';
import 'package:home_beautiful/screens/my_cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final List<dynamic> _titles = [
  {'lable': 'Popular', 'icon': Icons.star_border_purple500_outlined},
  {'lable': 'Chair', 'icon': Icons.chair_alt_outlined},
  {'lable': 'Table', 'icon': Icons.table_restaurant_outlined},
  {'lable': 'Armchair', 'icon': Icons.chair_outlined},
  {'lable': 'bed', 'icon': Icons.bed_outlined},
];

class _HomeState extends State<Home> {
  //  bool check = false;
   bool checkPopular = false;
   bool checkChair = false;
   bool checkTable = false;
   bool checkArmchair = false;
   bool checkbed = false;
  String productType = 'Popular';

  List<product> listProduct = [];
  StreamSubscription<List<product>>? streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription = databaseManage().getProduct().listen((event) {
      setState(() {
        listProduct = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: 'heroBottomBar',
          child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  appbar(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                        // height: MediaQuery.of(context).size.height * 0.67,
                        child:
                       StreamBuilder(
                         stream: databaseManage().getProduct(),
                         builder: (context, snapshot){
                           if(snapshot.hasData){
                             return
                               GridView.count(
                                 padding: EdgeInsets.only(top: 10, bottom: 20),
                                 crossAxisCount: 2,
                                 childAspectRatio: 0.58,
                                 crossAxisSpacing: 15.0,
                                 mainAxisSpacing: 15.0,
                                 children:
                                 List.generate(listProduct.length, (index) {
                                   return Center(
                                       child:GestureDetector(
                                         onTap: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context) =>Product(products: listProduct[index])));
                                         },
                                         child: contentProduct(
                                             img: listProduct[index].image,
                                             lable: listProduct[index].name,
                                             price: listProduct[index].price
                                         ),
                                       )
                                   );
                                 }
                                 )
                             );
                           }
                           else
                             {
                               return const Center(
                                 child: CircularProgressIndicator(),
                               );
                             }
                         },
                       )
                      ),
                  )
                ],
              )),
        ),
      ),
          
      
    );
  }

  Widget appbar() {
    return Container(
      // height: MediaQuery.of(context).size.height/5,
            // decoration:  BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    MyText.baseText(
                        text: 'MAKE HOME',
                        size: 17,
                        color: colorGray,
                        fontWeight: FontWeight.w400),
                    MyText.baseText(
                        text: 'BEAUTIFUL',
                        size: 22,
                        color: colorGray,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => my_cart()));
                  },
                  icon: Image(image: AssetImage("assets/img/cartCircle.png")))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 90,
            width: double.infinity,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        checkPopular =! checkPopular;
                        checkChair = false;
                        checkTable = false;
                        checkArmchair = false;
                        checkbed = false;
                      });
                            },
                    child: iconAndText(
                      icon: Icons.star_border_purple500_outlined,
                      lable: 'Popular',
                      colorsIcon: checkPopular? Colors.white : Colors.grey. shade700,
                      colorsBackground: checkPopular? Colors.black : Colors.grey.shade200,
                      colorsText: checkPopular ? true : false
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        checkChair = !checkChair;
                        checkPopular = false;
                        checkTable = false;
                        checkArmchair = false;
                        checkbed = false;
                      });
                            },
                    child: iconAndText(
                      icon: Icons.chair_alt_outlined,
                      lable: 'Chair',
                      colorsIcon: checkChair? Colors.white : Colors.grey. shade700,
                      colorsBackground: checkChair? Colors.black : Colors.grey.shade200,
                      colorsText: checkChair ? true : false
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        checkTable = !checkTable;
                        checkPopular = false;
                        checkChair = false;
                        checkArmchair = false;
                        checkbed = false;
                      });
                            },    
                    child: iconAndText(
                      icon: Icons.table_restaurant_outlined,
                      lable: 'Table',
                      colorsIcon: checkTable? Colors.white : Colors.grey. shade700,
                      colorsBackground: checkTable? Colors.black : Colors.grey.shade200,
                      colorsText: checkTable ? true : false
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        checkArmchair = !checkArmchair;
                        checkPopular = false;
                        checkChair = false;
                        checkTable = false;
                        checkbed = false;
                      });
                            },
                    child: iconAndText(
                      icon:  Icons.chair_outlined,
                      lable: 'Armchair',
                      colorsIcon: checkArmchair? Colors.white : Colors.grey. shade700,
                      colorsBackground: checkArmchair? Colors.black : Colors.grey.shade200,
                      colorsText: checkArmchair ? true : false
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        checkbed = !checkbed;
                        checkPopular = false;
                        checkChair = false;
                        checkTable = false;
                        checkArmchair = false;
                      });
                            },
                    child: iconAndText(
                      icon: Icons.bed_outlined,
                      lable: 'bed',
                      colorsIcon: checkbed? Colors.white : Colors.grey. shade700,
                      colorsBackground: checkbed? Colors.black : Colors.grey.shade200,
                      colorsText: checkbed ? true : false
                    ),
                  ),
                ]
              ),
          ),
        ],
      ),
    );
  }

  Widget iconAndText(
      {MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      IconData? icon,
      Color? colorsBackground,
      Color? colorsIcon,
      bool colorsText = false,
      String? lable}) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      width: 90,
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: colorsBackground,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Icon(
              icon,
              size: 30,
              color: colorsIcon,
            ),
          ),
          MyText.baseText(
            text: lable!, size: 18, fontWeight: FontWeight.w400, color: colorsText? colorBlack : colorGray)
        ],
      )
    );
  }

  Widget contentProduct(
      {MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      String? img,
      String? lable,
      num? price}) {
    return Container(
        // decoration: BoxDecoration(border: Border.all()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.height* 0.45,
                    decoration: BoxDecoration(
                    //  border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: NetworkImage(img!))
                    ),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(10),
                    //   child:  Image.network(img!),
                    // )
                  ),
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute( builder: (context) => LogIn()));
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xFFE0E0E0),
                        ),
                      
                      margin: EdgeInsets.only(bottom: 15, right: 15),
                      alignment: Alignment.center,
                      child: Icon(Icons.shopping_bag_outlined, size: 20,),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: MyText.baseText(
                  text: lable!,
                  size: 18,
                  color: colorGray,
                  fontWeight: FontWeight.w400),
            ),
            MyText.baseText(text: '\$ $price', size: 18, fontWeight: FontWeight.bold),
          ],
        ),
    );
  }

}