import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';
import '../ui/about.dart';


class AboutSection{

 static Widget aboutImage(double height,double width,String image){
    return Container(
      height:height,
      width:width,
      padding: EdgeInsets.all(screenWidth>=1400?45:25),
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
  // --------------------------------------ABOUT ME------------------------------------

  static Widget aboutMe(double height, double width, String description,double fontSize) {
   return Container(
     height:height,
     width:width,
     padding: EdgeInsets.all(screenWidth>=1400?45:25),
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
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Row(
           children: [
             Container(
               height:50,
               width:50,
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: AppColors.yellow!.withOpacity(0.3),
                 borderRadius: BorderRadius.circular(25),
               ) ,
               child: Container(
                 decoration: BoxDecoration(
                   color: AppColors.yellow,
                   borderRadius: BorderRadius.circular(25),
                 ) ,
                 child:Icon(Icons.person_outline_outlined,color: Colors.white,size: 15 ,),
               ),
             ),
             SizedBox( width: 25,),
             Text(
               'ABOUT ME',
               style: GoogleFonts.caveat(
                 color: AppColors.yellow,
                 fontSize:  screenWidth>=1400?48:40,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ],
         ),
         SizedBox(height:10,),
         Text(description, style: GoogleFonts.poppins(
             color: Color(0xFF3c3e41),
             fontSize: fontSize,
           ),
         ),
       ],
     ),
   );
  }
  // -----------------------------------BUTTON----------------------------------------
  static Widget Button(double? height,double width,String text,double fontSize,VoidCallback onTap,VoidCallback onEnter,VoidCallback onExit,bool isHover,){
   return  MouseRegion(
     onEnter: (event) {onEnter();},
     onExit: (event) {onExit();},
     child: InkWell(
       onTap: onTap,
       child: AnimatedContainer(
         duration: Duration(milliseconds: 200),
         height:height,
         width:width,
         margin:EdgeInsets.only(top:isHover?0: 10),
         decoration: BoxDecoration(
           // color: isHover?AppColors.yellow:null,
           gradient: LinearGradient(
             colors:isHover?[AppColors.yellow!,AppColors.yellow!]: [Colors.white, Color(0xFFe2e8ec)],
             begin: Alignment.bottomRight, end: Alignment.topLeft,
           ),
           borderRadius: BorderRadius.circular(5),
           boxShadow: [
             BoxShadow(
               color: Colors.white,blurRadius: 10, offset: Offset(-5, -5),
             ),
             BoxShadow(
               color: Color(0xFFD1D9E6), blurRadius: 15, offset: Offset(5, 5),
             ),
           ],
         ),
         child: Center(child: Text(text,style: TextStyle(color:isHover?Colors.white:AppColors.yellow,fontSize:fontSize),)),
       ),
     ),
   );
  }

// ------------------------------------------BUTTONS--------------------------------------
  static Widget aboutButtons(double height, double width,double fontSize,double space,Widget button1,Widget button2,MainAxisAlignment alignment){
   return  Container(
     height:height,
     width:width,
     padding: EdgeInsets.all(screenWidth>=1400?45:25),
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
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment:screenWidth>=1400?MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
       children: [
         Text("View my curriculum vitae:",style: GoogleFonts.poppins(fontSize:fontSize,color:Color(0xFF3C3E41)),),
         SizedBox(height: space,),
         Row(
           mainAxisAlignment:alignment,
           children: [
             button1,
             SizedBox(width:30),
             button2,
           ],
         ),
       ],
     ),
   );
  }




}