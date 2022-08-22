import 'package:flutter/material.dart';
import 'package:foodapp/utilities/constance.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/big_text.dart';

class MainColorButton extends StatelessWidget {
  const MainColorButton({
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height20),
        decoration: BoxDecoration(
            color: kMainColor, borderRadius: BorderRadius.circular(15)),
        child: BigText(text:buttonText,color: Colors.white,)
    );
  }
}