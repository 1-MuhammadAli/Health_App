
import 'package:flutter/material.dart';
import 'package:health_app/widgets/walkthrough_widget.dart';
class WalkthroughPage1 extends StatelessWidget {
  const WalkthroughPage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WalkthroughWidget(
        image: 'images/walkthrough.png',
        heading: 'Wherever you are health is number one',
        text: 'There is no instant way to a healthy life.',
      ),
    );
  }
}


