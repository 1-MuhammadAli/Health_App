import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_app/activity.dart';
import 'package:health_app/analytics.dart';

import 'WalkthroughPage1.dart';


class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int activeIndex = 0;
  double value = 0.3;

  List listStock = [
    const WalkthroughPage1(),
    const WalkthroughPage1(),
    const WalkthroughPage1(),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height*1,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: screenSize.height*0.85,
              color: Colors.white,
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                       index == 0 ? value = 0.3
                       : index == 1 ? value = 0.6
                       : value = 1.0  ;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  controller: PageController(viewportFraction: 1),
                  itemCount: listStock.length,
                  itemBuilder: (context, index) {
                    return listStock[index];
                  }),
            ),
            Column(
              children: [
                Container(
                  height: screenSize.height*0.015,
                  color: Colors.white,
                  child: Container(
                    width: screenSize.width*0.3, // Set your desired width
                    // Set your desired height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Set border radius
                      color: Colors.white, // Set background color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:  LinearProgressIndicator(
                        value: value,
                        backgroundColor: Colors.black, // Set background color of the progress bar
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green), // Set color of the progress bar
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top:
                  screenSize.height*0.03
                    //20.0
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Activity()),);
                    },
                    child: Container(
                      width: screenSize.width*0.7,
                      height: screenSize.height*0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black
                      ),
                      // width: 218,
                      // height: 48,
                      child: const Center(
                        child: Text('Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
