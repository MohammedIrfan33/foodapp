import 'package:flutter/material.dart';
import 'package:foodapp/screens/home/main_food_page_body.dart';
import 'package:foodapp/utilities/constance.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/small_text.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({Key? key}) : super(key: key);

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.height20),
              padding: EdgeInsets.symmetric(horizontal:Dimensions.width30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'Country',color: kMainColor),
                      const SmallText(text: 'City',color: Colors.black54,)
                    ],
                  ),
                  Container(
                    width: Dimensions.width40,
                    height: Dimensions.height40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius10),
                        color: kMainColor
                    ),
                    child:  Icon(Icons.search_rounded, color: Colors.white, size: Dimensions.iconSize20,),
                  )
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(child: const MainFoodPageBody()))
          ],
        ),
      ),
    );
  }
}
