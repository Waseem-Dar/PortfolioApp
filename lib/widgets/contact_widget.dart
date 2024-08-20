import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/config/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection{



  static Widget SocialIconWidget(String iconPath,bool isHover,VoidCallback onTap,VoidCallback onEnter,VoidCallback onExit){
  return MouseRegion(
    onEnter: (event){onEnter();},
    onExit: (event) {onExit();},
    child: InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 280),
        height: 60,
        width: 60,
        margin: EdgeInsets.only(top: isHover?0:5,right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:isHover?[AppColors.yellow!,AppColors.yellow!]: [Colors.white, Color(0xFFe2e8ec)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Color(0xFFD1D9E6),
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Center(child: ImageIcon(AssetImage(iconPath),size: 25,color:isHover?Colors.white: Color(0xFF3C3E41),),),
      ),
    ),
  );
  }




  static Widget TextFieldWidget(String labelText,bool isMessage){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(labelText.toUpperCase(),style: GoogleFonts.montserrat(fontSize: 12,color: Color(0xFF3C3E41),fontWeight: FontWeight.w500,letterSpacing: 1,),),
        SizedBox(height: 10,),
        TextField(
          cursorColor: AppColors.black,
          cursorWidth: 1,
          cursorHeight: 20,
          maxLines: isMessage?5:1,
          style: GoogleFonts.poppins(color: AppColors.black.withOpacity(0.7)),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: AppColors.black.withOpacity(0.3),width: 1,)
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: AppColors.yellow!,width: 1,)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: AppColors.yellow!,width: 1,)
            ),

          ),


        ),
      ],
    );
  }





}