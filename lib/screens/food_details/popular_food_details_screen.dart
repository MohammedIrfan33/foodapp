import 'package:flutter/material.dart';
import 'package:foodapp/utilities/constance.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/bottom_radius_container.dart';
import 'package:foodapp/widgets/column_icon_text.dart';
import 'package:foodapp/widgets/main_color_button.dart';
import 'package:foodapp/widgets/small_text.dart';

class PopularFoodDetailsScreen extends StatelessWidget {
  const PopularFoodDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //head image section
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: Dimensions.screenWidth,
              height: Dimensions.height300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/foodpage3.png'))),
            ),
          ),
          //head icons
          Positioned(
            top: Dimensions.height40,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  onPress: () {},
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  onPress: () {},
                ),
              ],
            ),
          ),
          //bottom content section
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.height300 - 20,
              child: Container(
                padding: EdgeInsets.all(Dimensions.height15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //heading icon rating section
                    const ColumnIconText(
                      headingText: 'Chinese dish',
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //food description
                    const BigText(text: 'Introduce'),
                    SizedBox(height: Dimensions.height20,),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExtendableParagraph(
                            text:
                                '''This type of biryani is based on a Persian cooking This aromatic type of biryani is popular in Pakistan and known for its spicy taste, fragrant rice, and delicate meat. It is made with meat and basmati rice, vegetables, and various types of spices.  style so it uses the dum pukht method where the meat and gravy are only cooked partially and are then layered and served in a sealed handi. The spice profile is not as intense.''',
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: BottomRadiusContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: Row(
                  children: [
                    AddRemoveButton(
                      icon: Icons.remove,
                      onPress: () {
                        print('remove');
                      },
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const BigText(text: '0'),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    AddRemoveButton(
                      icon: Icons.add,
                      onPress: () {
                        print('add');
                      },
                    )
                  ],
                )),
            const MainColorButton(
              buttonText: '\$8.00 Add to Cart',
            ),
          ],
        ),
      ),
    );
  }
}

class AddRemoveButton extends StatelessWidget {
  const AddRemoveButton({
    required this.icon,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress(),
      icon: Icon(
        icon,
        color: kSignColor,
      ),
      padding: const EdgeInsets.all(0),
      constraints: const BoxConstraints(),
    );
  }
}

class ExtendableParagraph extends StatefulWidget {
  const ExtendableParagraph({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  State<ExtendableParagraph> createState() => _ExtendableParagraphState();
}

class _ExtendableParagraphState extends State<ExtendableParagraph> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.height200;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              color: kParaColor,
              size: 14.0,
            )
          : Column(
              children: [
                SmallText(
                    color: kParaColor,
                    size: 14.0,
                    text: hiddenText
                        ? ("$firstHalf...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: 'Show ${hiddenText?'More':'Less'}',
                        color: kMainColor,
                        size: 14,
                      ),
                      Icon(
                        hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,
                        color: kMainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
