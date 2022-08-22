import 'package:flutter/material.dart';
import 'package:foodapp/utilities/constance.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/row_icon_text.dart';
import 'package:foodapp/widgets/small_text.dart';

class ColumnIconText extends StatelessWidget {
  const ColumnIconText({
    required this.headingText,
    Key? key,
  }) : super(key: key);

  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: headingText),
        SizedBox(
          height: Dimensions.height10,
        ),
        //central row
        Row(
          children: [
            //rating
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    size: Dimensions.iconSize15,
                    color: kMainColor,
                  )),
            ),
            kHorizontalSpace,
            SmallText(text: '4.5'),
            kHorizontalSpace,
            SmallText(text: '123'),
            SmallText(text: 'Comment'),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        //icon text row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RowIconText(
                icon: Icons.circle_sharp,
                text: 'Normal',
                color: kIconColor1),
            RowIconText(
                icon: Icons.location_on,
                text: '1.7km',
                color: kMainColor),
            RowIconText(
                icon: Icons.access_time_rounded,
                text: '32min',
                color: kIconColor2)
          ],
        )
      ],
    );
  }
}

