import 'package:flutter/material.dart';
import 'package:foodapp/utilities/dimensions.dart';


class BigText extends StatelessWidget {
  const BigText({
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size =0,
    this.textOverflow,
    Key? key}) : super(key: key);

  final String text;
  final double size;
  final Color color;
  final TextOverflow ? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size==0 ? Dimensions.font20 : size,
        fontWeight: FontWeight.w400,
      ),
      overflow: textOverflow,
    );
  }
}
