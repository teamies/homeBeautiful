import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/models/review.dart';
import 'package:home_beautiful/screens/Product.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              appBar(), 
              Header(), 
              Expanded(child: comments()),
              Container(
                width: double.infinity,
                child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context, MaterialPageRoute(builder: (context) => buttonBar()));
                      },
                      child: MyText.baseText(text: 'Write a review', color: colorWhite),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff242424),
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ),
              ),
            ],
          )
        ),
      ),
    );
  }

  Widget appBar(){
    return Container(
      // height: MediaQuery.of(context).size.height/5,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            // decoration: BoxDecoration(border: Border.all()),
              child: MyText.baseText(
                text: 'Rating & Review',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold),
            ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Product()));
            },
            child: Icon(
              Icons.chevron_left,
              color: Colors.grey,
              size: 30,),
          ),
    ],
      ),
    );
  }

  Widget Header(){
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20,),
      height: 140,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                 alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: AssetImage(listProduct[0].image)
               )
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyText.baseText(text: listProduct[0].title, size: 16, fontWeight: FontWeight.w400),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow,),
                    MyText.baseText(text: '4.7', size: 20, fontWeight: FontWeight.bold)
                  ],
                ),
                MyText.baseText(text: '10 reviews'),
              ],
            ),
        ],
      ),
    );
  }

  Widget comments(){
    return Container(
      child: ListView.builder(
        itemCount: listReview.length,
          itemBuilder: (context, index){
          final item = listReview[index];
            return fromcomment(
            title: item.title,
            date: item.date,
            comment: item.comment,
            img: item.image
          );
        }
      )
    );
  }

  Widget fromcomment({
    String? title ,comment,date,img,
    // Icon? icon,
    }){
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.baseText(text: title!, color: colorBlack),
                    MyText.baseText(text: date, color: colorGray)
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 7, bottom: 15),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow,),
                      Icon(Icons.star, color: Colors.yellow,),
                      Icon(Icons.star, color: Colors.yellow,),
                      Icon(Icons.star, color: Colors.yellow,),
                      Icon(Icons.star, color: Colors.yellow,),
                    ],
                  ),
                ),
                MyText.baseText(text: comment!, color: colorGray)
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage: AssetImage(img),
            ),
          )
        ],
      ),
    );
  }
}