import 'package:flutter/material.dart';

class WalkthroughWidget extends StatelessWidget {
  String image;
  String heading;
  String text;
  WalkthroughWidget({super.key,
    required this.image,
    required this.heading,required this.text});

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: screenSize.height*0.65,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            ),
          ),
        ),
        Container(
          height: screenSize.height*0.2,
          width: screenSize.width*1,
          decoration:  const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 50,
                blurRadius: 100,
                offset: Offset(0, -15), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: screenSize.width * 0.8,
                  child: Text(heading,
                    textAlign: TextAlign.center,
                    style:
                    // GoogleFonts.openSans(textStyle:
                    const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: 275,
                    height: 48,
                    child: Text(text,
                      textAlign: TextAlign.center,
                      style:
                      //GoogleFonts.openSans(textStyle:
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,

                      ),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}