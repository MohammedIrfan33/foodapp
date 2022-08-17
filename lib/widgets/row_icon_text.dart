import 'package:flutter/material.dart';
import 'package:foodapp/widgets/small_text.dart';

class RowIconText extends StatelessWidget {
  const RowIconText({
    required this.icon,
    required this.text,
    required this.color,
    Key? key
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(width: 3.0,),
        SmallText(text: text),
      ],
    );
  }
}
