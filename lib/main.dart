import 'package:flutter/material.dart';
import 'package:foodapp/screens/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily:'Roboto'
      ),
      home: MainFoodPage(),
    );
  }
}