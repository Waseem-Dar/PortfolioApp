import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_web_portfolio/widgets/about_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/skills.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';


class About extends StatefulWidget {

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final String  menImage=  "images/men_image.jpg";

 final String _description =
      "Enthusiastic and skilled Flutter developer with 1+ year experience in mobile application development. Proficient in Dart programing language and experienced in building cross-platform mobile apps using Flutter framework. Strong understanding of software development principles, UI/UX design, and mobile app architecture. Dedicated team player with excellent communication and problem-solving skills.";

 bool isHover = false;
 bool isHover1 = false;

  @override
  Widget build(BuildContext context) {
double  screenWidth= MediaQuery.of(context).size.width;
    return ResponsiveWidget(
    tabletScreen: Container(),
        desktopScreen: Container(
          color: Color(0xFFECF0F3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 100
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AboutWidget.aboutImage(screenWidth>=1400?600:450, screenWidth>=1400?600:450, menImage),
                    // Container(
                    //   height:screenWidth>=1400?600:450,
                    //   width:screenWidth>=1400?600:450,
                    //   padding: EdgeInsets.all(25),
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //       colors: [Colors.white, Color(0xFFe2e8ec)],
                    //       begin: Alignment.bottomRight, end: Alignment.topLeft,
                    //     ),
                    //     borderRadius: BorderRadius.circular(10),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.white,blurRadius: 10, offset: Offset(-5, -5),
                    //       ),
                    //       BoxShadow(
                    //         color: Color(0xFFD1D9E6), blurRadius: 15, offset: Offset(5, 5),
                    //       ),
                    //     ],
                    //   ),
                    //                                                               // Image background
                    //       child:Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           image: DecorationImage(
                    //             image: AssetImage(menImage),
                    //             fit: BoxFit.cover,alignment: Alignment.center
                    //           ),
                    //         ),
                    //       ),
                    // ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        Container(
                          height:screenWidth>=1400?380:290,
                          width:screenWidth>=1400?600:510,
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
                                  SizedBox( width: 35,),
                                  Text(
                                    'ABOUT ME',
                                    style: GoogleFonts.caveat(
                                      color: AppColors.yellow,
                                      fontSize:  screenWidth>=1400?50:40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                _description,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF3c3e41),
                                  fontSize: screenWidth>=1400?20:15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:30,),
                        Container(
                          height:screenWidth>=1400?180:130,
                          width:screenWidth>=1400?600:510,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:screenWidth>=1400?MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("View my curriculum vitae:",style: GoogleFonts.poppins(fontSize:screenWidth>=1400?20:15,color:Color(0xFF3C3E41)),),
                              SizedBox(height: screenWidth>=1400?15:0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MouseRegion(
                                    onEnter: (_) => setState(() => isHover = true),
                                    onExit: (_) => setState(() => isHover = false),
                                    child: InkWell(
                                      onTap: () {},
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        height:screenWidth>=1400?48:40,
                                        width:screenWidth>=1400?160:140,
                                        margin:EdgeInsets.only(top:isHover?0: 10),
                                        decoration: BoxDecoration(
                                          // color: isHover?AppColors.yellow:null,
                                          gradient: LinearGradient(
                                            colors:isHover?[AppColors.yellow!,AppColors.yellow!]: [Colors.white, Color(0xFFe2e8ec)],
                                            begin: Alignment.bottomRight, end: Alignment.topLeft,
                                          ),
                                          borderRadius: BorderRadius.circular(3),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,blurRadius: 10, offset: Offset(-5, -5),
                                            ),
                                            BoxShadow(
                                              color: Color(0xFFD1D9E6), blurRadius: 15, offset: Offset(5, 5),
                                            ),
                                          ],
                                        ),
                                        child: Center(child: Text('VIEW RESUME',style: TextStyle(color:isHover?Colors.white:AppColors.yellow,fontSize: screenWidth>=1400?19:14 ),)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width:30),
                                  MouseRegion(
                                    onEnter: (_) => setState(() => isHover1 = true),
                                    onExit: (_) => setState(() => isHover1 = false),
                                    child: InkWell(
                                      onTap: () {},
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        height:screenWidth>=1400?48:40,
                                        width:screenWidth>=1400?180:140,
                                        margin:EdgeInsets.only(top:isHover1?0: 10),
                                        decoration: BoxDecoration(
                                          // color: isHover?AppColors.yellow:null,
                                          gradient: LinearGradient(
                                            colors:isHover1?[AppColors.yellow!,AppColors.yellow!]: [Colors.white, Color(0xFFe2e8ec)],
                                            begin: Alignment.bottomRight, end: Alignment.topLeft,
                                          ),
                                          borderRadius: BorderRadius.circular(3),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,blurRadius: 10, offset: Offset(-5, -5),
                                            ),
                                            BoxShadow(
                                              color: Color(0xFFD1D9E6), blurRadius: 15, offset: Offset(5, 5),
                                            ),
                                          ],
                                        ),
                                        child: Center(child: Text('HIRE ME NOW',style: TextStyle(color:isHover1?Colors.white:AppColors.yellow,fontSize: screenWidth>=1400?19:14),)),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
      );}

  void _downloadCV() {
    launch(AppConstants.cv);
  }

  // Widget _buildSkill(Skill skill) => Container(
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
