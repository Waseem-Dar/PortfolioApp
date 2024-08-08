import 'package:flutter/material.dart';

import 'ui/home.dart';
import 'config/colors.dart';

void main() {
  runApp(MyApp());
}
late double screenWidth;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OuahidDev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: AppColors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
