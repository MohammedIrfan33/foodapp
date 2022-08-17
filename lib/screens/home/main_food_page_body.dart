import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utilities/constance.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/row_icon_text.dart';
import 'package:foodapp/widgets/small_text.dart';

class MainFoodPageBody extends StatefulWidget {
  const MainFoodPageBody({Key? key}) : super(key: key);

  @override
  State<MainFoodPageBody> createState() => _MainFoodPageBodyState();
}

class _MainFoodPageBodyState extends State<MainFoodPageBody> {
  PageController pageController = PageController(viewportFraction: .85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  double height = Dimensions.pageViewImageContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  List<String> images = [
    'assets/images/foodpage1.png',
    'assets/images/foodpage2.png',
    'assets/images/foodpage3.png',
    'assets/images/foodpage4.png',
    'assets/images/foodpage5.png',
    'assets/images/foodpage6.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //pager view Slider
        Container(
          height: Dimensions.pageViewContainer,
          child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return _buildItem(index);
              }),
        ),
        //dots indicator
        DotsIndicator(
          dotsCount: images.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: kMainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        //PopularText
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Popular '),
              SizedBox(width: Dimensions.width10,),
              Container(margin: const EdgeInsets.only(bottom: 4) ,child: const BigText(text: '.' ,color: Colors.black26,)),
              SizedBox(width: Dimensions.width10,),
              Container(margin:const EdgeInsets.only(bottom: 3),child: const SmallText(text: 'Food pairing'))
            ],
          ),
        ),

        //food image scrollable
       Container(
         height: 900,
         margin: EdgeInsets.only(left: Dimensions.width20,top: Dimensions.height20,right: Dimensions.width20),
         child: ListView.builder(
           scrollDirection: Axis.vertical,
           physics: const NeverScrollableScrollPhysics(),
           itemCount: 10,
             itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(bottom: Dimensions.height20),
                child: Row(
                  children: [
                    Container(
                     height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        image: DecorationImage(
                          image:AssetImage('assets/images/foodpage1.png'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          )
                        ),

                      ),
                    )
                  ],
                ),
              );
             }
         ),
       )
      ],
    );
  }

  //method  to return each pageview items
  Widget _buildItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransition = height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransition, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransition = height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransition, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransition = height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransition, 0);
    } else {
      var currentScale = 0.8;
      var currentTransition = height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransition, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewImageContainer,
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width10, vertical: Dimensions.height10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage(
                    image: AssetImage(images[index]), fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5.0,
                      offset: const Offset(0, 5),
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.all(Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: 'Chinese Side'),
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
