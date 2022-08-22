import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
  const AppIcon({
    required this.icon,
    required this.onPress,
    this.iconColor=const Color(0xFF756d54),
    this.backgroundColor=const Color(0xFFfcf4e4),

    Key? key}) : super(key: key);

  final  IconData icon;
  final  Color iconColor;
  final Color backgroundColor;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress(),
      style: TextButton.styleFrom(
          backgroundColor:  backgroundColor,
          shape: const CircleBorder(),
          side: BorderSide.none,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(10),
          elevation: 0,

      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16.0,
    ),
    );
  }
}
