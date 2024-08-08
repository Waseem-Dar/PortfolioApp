import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';
import '../ui/about.dart';


class AboutWidget{

 static Widget aboutImage(double height,double width,String image){
    return Container(
      height:height,
      width:width,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xFFe2e8ec)],
          begin: Alignment.bottomRight, end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white,blurRadius: 10, offset: Offset(-5, -5),
          ),
          BoxShadow(
            color: Color(0xFFD1D9E6), blurRadius: 15, offset: Offset(5, 5),
          ),
        ],
      ),
      // Image background
      child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,alignment: Alignment.center
          ),
        ),
      ),
    );
  }



}