import 'package:flutter/material.dart';
import 'package:home_beautiful/components/mytext.dart';
import 'package:home_beautiful/core/_config.dart';

class congrats extends StatefulWidget {
  const congrats({Key? key}) : super(key: key);

  @override
  State<congrats> createState() => _congratsState();
}

class _congratsState extends State<congrats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                    child: Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                      child: Column(
                        children: [
                          MyText.baseText(text: 'SUCCESS!',size: 30 ,fontWeight: FontWeight.bold),
                          Image.asset('assets/img/chair.png'),
                          MyText.baseText(text: 'Your order will be delivered soon.', color: colorGray),
                          MyText.baseText(text: 'Thank your for choosing out app', color: colorGray),

                        ]

                  ),
                    )),

              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                         Container(
                           width: double.infinity,
                           height: MediaQuery.of(context).size.height*0.08,
                           child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.black),
                                ),
                                onPressed: (){},
                                child: MyText.baseText(text: 'Track your orders', color: colorWhite),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.08,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                              ),
                              onPressed: (){},
                              child: MyText.baseText(text: 'Back to home', color: colorWhite),
                            ),
                          ),
                        )
                      ],

                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}

