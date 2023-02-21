import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/LogIn.dart';
import 'package:home_beautiful/screens/Product.dart';
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
  //  bool check = false;
   bool checkPopular = false;
   bool checkChair = false;
   bool checkTable = false;
   bool checkArmchair = false;
   bool checkbed = false;
  //  List productType = ['Popular', 'Chair','Table','Armchair','bed'];
  String productType = 'Popular';

  //  void asas(){
  //   for(int i=0;i<listProduct.length;i++){
  //     if(listProduct[i].type == productType){
        
  //     }
  //   }
  //  }

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
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height * 0.67,

                      // child: CheckProduct(productType),

                      // child: List.generate(listProduct.length, (index) {
                      //   return listProduct[index].type = productType?
                      //   Center(child: 
                      //   contentProduct(
                      //     img: listProduct[index].image,
                      //     lable: listProduct[index].title,
                      //     price: listProduct[index].price)) : MyText.baseText(text: 'blank')
                      // }),

                      child: GridView.count(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                          crossAxisCount: 2,
                          childAspectRatio: 0.64,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          children: 
                            List.generate(listProduct.length, (index) {
                              return Center(
                                child: contentProduct(
                                  img: listProduct[index].image,
                                  lable: listProduct[index].title,
                                  price: listProduct[index].price
                                )
                              );
                            }
                        )
                      ) 


                      // child: ListView.builder(
                      //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   //   crossAxisCount: 2,
                      //   //   childAspectRatio: 0.64,
                      //   //   crossAxisSpacing: 15.0,
                      //   //   mainAxisSpacing: 15.0,
                      //   // ), 
                      //   itemCount: listProduct.length,
                      //   itemBuilder: (context, index) {

                      //     if(listProduct[index].type != productType){
                      //     return Container(
                      //       height: 150,
                      //       child: contentProduct(
                      //         img: listProduct[index].image,
                      //         lable: listProduct[index].title,
                      //         price: listProduct[index].price),
                      //     );
                      //     }return SizedBox(
                      //     );
                      //   },
                      // ),
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
                  onPressed: () {},
                  icon: Image(image: AssetImage("assets/img/cartCircle.png")))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: (MediaQuery.of(context).size.width - 40) / 5,
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
      width: (MediaQuery.of(context).size.width - 40) / 5,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
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
      double? price}) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Product()));
      },
      child: Container(
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
                    child: Image.asset(
                      img!,
                      width: MediaQuery.of(context).size.width * 0.5,
                    )),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
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
            MyText.baseText(text: '\$ $price\0', size: 18, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

  //   Widget CheckProduct(String productType) {
  //   Widget product;

  //   switch(productType){
  //     case 'Popular':
  //     product = 
  //       GridView.count(
  //         padding: EdgeInsets.only(top: 10, bottom: 20),
  //           crossAxisCount: 2,
  //           childAspectRatio: 0.64,
  //           crossAxisSpacing: 15.0,
  //           mainAxisSpacing: 15.0,
  //           children: List.generate(listProduct.length, (index) {
  //             return Center(
  //                 child: contentProduct(
  //                     img: listProduct[index].image,
  //                     lable: listProduct[index].title,
  //                     price: listProduct[index].price));
  //           }
  //         )
  //       );
  //       break;
  //     case 'Table':
  //     product = 
  //       GridView.count(
  //         padding: EdgeInsets.only(top: 10, bottom: 20),
  //           crossAxisCount: 2,
  //           childAspectRatio: 0.64,
  //           crossAxisSpacing: 15.0,
  //           mainAxisSpacing: 15.0,
  //           children: List.generate(listProduct.length, (index) {
  //             return Center(
  //                 child: contentProduct(
  //                     img: listProduct[index].image,
  //                     lable: listProduct[index].title,
  //                     price: listProduct[index].price));
  //           }
  //         )
  //       );
  //       break;

  //     default:
  //       product = Container(
  //         child: MyText.baseText(text: 'Không có sản phẩm nào'),
  //       );
  //   }

  //   return Container(
  //     child: product,
  //   );
  // }
}