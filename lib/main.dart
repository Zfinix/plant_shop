import 'package:flutter/material.dart';
import 'package:plant_shop/utils/theme.dart';
import 'package:plant_shop/utils/navigator.dart';
import 'package:plant_shop/views/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Plant Shop',
      debugShowCheckedModeBanner: false,
      theme: context.themeData,
      navigatorKey: navigator.key,
      home: HomeScreen(),
    );
  }
}

