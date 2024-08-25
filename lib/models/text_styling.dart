import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.size = "medium",
      this.color = Colors.white,
      this.weight = FontWeight.bold});

  final String text;
  final String size;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Text(
      text,
      style: TextStyle(
        fontSize: size == "large"
            ? screenSize.width * 0.058
            : (size == "medium"
                ? screenSize.width * 0.053
                : screenSize.width * 0.030),
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
