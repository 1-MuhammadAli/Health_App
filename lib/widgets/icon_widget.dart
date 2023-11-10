import 'package:flutter/cupertino.dart';

class IconWidget extends StatelessWidget {
  String image;
  Color color;
   IconWidget({super.key,
   required this.image,required this.color});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Image.asset(image),
    );
  }
}
