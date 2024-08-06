
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/skills.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';


class About extends StatelessWidget {

  final String  menImage=  "images/men_image.jpg";

 final String _description =
      "  Enthusiastic and skilled Flutter developer with 1+ year experience in mobile application development. Proficient in Dart programing language and experienced in building cross-platform mobile apps using Flutter framework. Strong understanding of software development principles, UI/UX design, and mobile app architecture. Dedicated team player with excellent communication and problem-solving skills.";


  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          color: Color(0xFFECF0F3),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .10,
                    right: MediaQuery.of(context).size.width * .10,
                    top: 100
                  // horizontal: MediaQuery.of(context).size.width * .10,
                  // vertical: 100,
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.width * 0.32,
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
                                image: AssetImage(menImage),
                                fit: BoxFit.cover,alignment: Alignment.center
                              ),
                            ),
                          ),
                    ),

                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width*0.20,
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
                                Text(
                                  'ABOUT ME',
                                  style: GoogleFonts.caveat(
                                    color: AppColors.yellow,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _description,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF3c3e41),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width *0.020,),
                          Container(
                            height: MediaQuery.of(context).size.width*0.11,
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
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.yellow,
                                    textStyle: TextStyle(color: Colors.white),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30,vertical: 20),
                                  ),

                                  child: Text('HIRE ME NOW',style: TextStyle(color: Colors.white),),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: _downloadCV,
                                  style: ElevatedButton.styleFrom(
                                    textStyle:TextStyle(color: Colors.white),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                    backgroundColor: AppColors.black,

                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30,vertical: 20),
                                  ),
                                  child: Text('VIEW RESUME',style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .10,
                  right: MediaQuery.of(context).size.width * .10,
                  bottom: 100
                  // horizontal: MediaQuery.of(context).size.width * .10,
                  // vertical: 100,
                ),
                // height: 500,
                decoration: BoxDecoration(
                  color: Color(0xFFECF0F3),
                  // image:DecorationImage(image: AssetImage("images/skill_backgroung_image.png"),fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    Stack(alignment: Alignment.bottomCenter,
                      children: [
                        AppTitle('MY SKILLS', 50, 0.05),
                        AppTitle('MY SKILLS', 35, 0.8),
                        // Text('MY SKILLS', style: AppStyles.title),
                        // Text('MY SKILLS', style: AppStyles1.title),
                      ],
                    ),
                Container(width: 100, height: 2, color: AppColors.yellow),
                const SizedBox(height: 3),
                Container(width: 75, height: 2, color: AppColors.yellow),
                const SizedBox(height: 50),
                Wrap(
                  spacing: 25,
                  runSpacing: 25,alignment:WrapAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: SKILLS.map(_buildSkill).toList(),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
        mobileScreen: Container(
          color: Color(0xFFECF0F3),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05,
            vertical: 50,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  color: AppColors.greyLight,
                  child: Image.asset(
                    menImage,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'ABOUT ME',
                style: GoogleFonts.caveat(
                  color: AppColors.yellow,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _description,
                style: GoogleFonts.poppins(
                  color: Color(0xFF3c3e41),
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),

                padding:
                    const EdgeInsets.symmetric(horizontal: 25,vertical: 17),
                ),
                child: Text('HIRE ME NOW',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _downloadCV,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),

                  padding:
                  const EdgeInsets.symmetric(horizontal: 25,vertical: 17),
                ),
                child: Text('VIEW RESUME',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
              ),
              const SizedBox(height: 50),
             Container(
               decoration: BoxDecoration(
                 color: Color(0xFFECF0F3),
                 // image:DecorationImage(image: AssetImage("images/skill_backgroung_image.png"),fit: BoxFit.fill),
               ),
               child: Column(
                 children: [
                   Stack(alignment: Alignment.bottomCenter,
                     children: [
                       AppTitle('MY SKILLS', 33, 0.05),
                       AppTitle('MY SKILLS', 20, 0.8),
                       // Text('MY SKILLS', style: AppStyles.title),
                       // Text('MY SKILLS', style: AppStyles1.title),
                     ],
                   ),
                   Container(width: 75, height: 2, color: AppColors.yellow),
                   const SizedBox(height: 3),
                   Container(width: 50, height: 2, color: AppColors.yellow),
                   const SizedBox(height: 25),
                   Wrap(
                     spacing: 10,
                     runSpacing: 10,
                     alignment: WrapAlignment.center,
                     runAlignment: WrapAlignment.spaceBetween,
                     children: SKILLS.map(_buildSkill).toList(),
                   ),
                 ],
               ),
             )
            ],
          ),
        ),
      );

  void _downloadCV() {
    launch(AppConstants.cv);
  }

  // Widget _buildSkill(Skill skill) => Container(
  //   decoration: BoxDecoration(
  //   color: Colors.white,
  //     boxShadow: [
  //       BoxShadow(color: Colors.black12.withOpacity(0.059),spreadRadius: 2,blurRadius: 5)
  //     ]
  //   ),
  //   padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
  //   margin: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
  //   child: Text(skill.name!),
  // );

  Widget _buildSkill(Skill skill) => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white,Color(0xFFe2e8ec)],begin: Alignment.bottomRight,end: Alignment.topLeft),
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(color: Colors.white,blurRadius: 10,offset: Offset(-5, -5),),
          BoxShadow(color: Color(0xFFD1D9E6),blurRadius: 15,offset: Offset(5, 5)),
        ]
    ),
    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
    margin: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
    child: Text(skill.name!),
  );
}
