import 'package:flutter/material.dart';
import 'package:foodapp/utilities/dimensions.dart';

class BottomRadiusContainer  extends StatelessWidget {
  const BottomRadiusContainer ({
    required this.child,
    Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Dimensions.height100,
        padding: EdgeInsets.fromLTRB(Dimensions.width20, 0, Dimensions.width20, Dimensions.height20),
    decoration: BoxDecoration(
    color: Colors.grey.shade50,
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(Dimensions.radius20 * 2),
    topLeft: Radius.circular(Dimensions.radius20 * 2))),
    child: child,
    );
  }
}
