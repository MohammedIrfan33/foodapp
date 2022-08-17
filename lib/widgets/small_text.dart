import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 12,
    Key? key}) : super(key: key);

  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: 1.2,
      ),
    );
  }
}

