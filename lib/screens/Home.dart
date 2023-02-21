import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/LogIn.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
              appbar(),
                Expanded(
                  flex: 5,
                  child: Container(
                      child: GridView.count(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                          crossAxisCount: 2,
                          childAspectRatio: 0.66,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          children: List.generate(listProduct.length, (index) {
                            return Center(
                                child: product(
                                    img: listProduct[index].image,
                                    lable: listProduct[index].title,
                                    price: listProduct[index].price));
                          }))
                      ),
                )
              ],
            )),
      ),
          
      
    );
  }

  Widget appbar() {
    return Container(
      height: MediaQuery.of(context).size.height/5,
            // decoration: BoxDecoration(border: Border.all()),
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
                    onPressed: () {},
                    icon: Image(image: AssetImage("assets/img/cartCircle.png")))
              ],
            ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return iconAndText(
                        icon: _titles[index]['icon'],
                        lable: _titles[index]['lable']);
                  }),
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
      String? lable}) {
    return Container(
      width: (MediaQuery.of(context).size.width-40)/5,
      child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Icon(
                icon,
                size: 30,
                color: Colors.black,
              ),
            ),
                MyText.baseText(
                    text: lable!, size: 14, fontWeight: FontWeight.w400),

          ],

      ),
    );
  }

  Widget product(
      {MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      String? img,
      String? lable,
      double? price}) {
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
                  // height: 50,
                  // width: MediaQuery.of(context).size.width*0.4,
                  child: Image.asset(
                    img!,
                    width: MediaQuery.of(context).size.width * 0.5,
                  )),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFFE0E0E0),
                    ),
                  
                  margin: EdgeInsets.only(bottom: 15, right: 15),
                  alignment: Alignment.center,
                  child: Icon(Icons.shopping_bag_outlined, size: 20,),
                )
              ],
            ),
          ),
          MyText.baseText(
              text: lable!,
              size: 18,
              color: colorGray,
              fontWeight: FontWeight.w400),
          MyText.baseText(text: '\$ $price\0', size: 18, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}

