import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/ui/responsive_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/constants.dart';
import '../config/colors.dart';

class Header extends StatelessWidget {
  final String _name = "Sabir";
  final String _job = "Mobile Developer";
  final String _description =
      "I am developer has around 1+ years experience developing Android and IOS mobile applications, using Flutter framework  and Dart programing language.";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'I’m $_name',
                style: GoogleFonts.merriweatherSans(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                _job,
                style: GoogleFonts.merriweatherSans(
                  color: AppColors.yellow,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  _description,
                  style: GoogleFonts.poppins(

                        color: Colors.grey[100],
                        fontSize: 15,
                      ),   textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow,
                  textStyle: TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30,),
                ),

                onPressed: _downloadCV,
                child: Text('Download CV',style: GoogleFonts.chakraPetch(color: Colors.white,fontWeight: FontWeight.w700),),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        mobileScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: FittedBox(
            child: Column(
              children: [
                Text(
                  'I’m $_name',
                  style: GoogleFonts.merriweatherSans(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  _job,
                  style: GoogleFonts.merriweatherSans(
                    color: AppColors.yellow,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    _description,
                    style: GoogleFonts.poppins(
                          color: Colors.grey[100],
                          fontSize: 14,
                          height: 1.8,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                    textStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  ),

                  onPressed: _downloadCV,
                  child: Text('Download CV',style: GoogleFonts.chakraPetch(color: Colors.white),),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      );

  void _downloadCV() {
    launch(AppConstants.cv);
  }
}


