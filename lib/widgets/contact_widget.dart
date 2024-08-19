import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/config/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection{



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