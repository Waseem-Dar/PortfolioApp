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
  final String menImage = "images/men_image.jpg";

  final String _description =
      "Enthusiastic and skilled Flutter developer with 1+ year experience in mobile application development. Proficient in Dart programing language and experienced in building cross-platform mobile apps using Flutter framework. Strong understanding of software development principles, UI/UX design, and mobile app architecture. Dedicated team player with excellent communication and problem-solving skills.";

  bool isHover = false;
  bool isHover1 = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveWidget(
      desktopScreen: Container(
        color: Color(0xFFECF0F3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AboutSection.aboutImage(screenWidth >= 1400 ? 685 : 450,
                      screenWidth >= 1400 ? 685 : 450, menImage),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      AboutSection.aboutMe(
                          screenWidth >= 1400 ? 435 : 290,
                          screenWidth >= 1400 ? 685 : 510,
                          _description,
                          screenWidth >= 1400 ? 19 : 15),
                      SizedBox(
                        height: 30,
                      ),
                      AboutSection.aboutButtons(
                          screenWidth >= 1400 ? 220 : 130,
                          screenWidth >= 1400 ? 685 : 510,
                          screenWidth >= 1400 ? 20 : 15,
                          screenWidth >= 1400 ? 15 : 0,
                          AboutSection.Button(
                              screenWidth >= 1400 ? 48 : 40,
                              screenWidth >= 1400 ? 180 : 140,
                              'VIEW RESUME',
                              screenWidth >= 1400 ? 19 : 14,
                              () {}, () {
                            setState(() {
                              isHover = true;
                            });
                          }, () {
                            setState(() {
                              isHover = false;
                            });
                          }, isHover),
                          AboutSection.Button(
                              screenWidth >= 1400 ? 48 : 40,
                              screenWidth >= 1400 ? 180 : 140,
                              'HIRE ME NOW',
                              screenWidth >= 1400 ? 19 : 14,
                              () {}, () {
                            setState(() {
                              isHover1 = true;
                            });
                          }, () {
                            setState(() {
                              isHover1 = false;
                            });
                          }, isHover1),
                          screenWidth >= 1400
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: screenWidth >= 1400 ? 1400 : null,
              padding: EdgeInsets.only(
                  left: screenWidth >= 1400
                      ? 0
                      : MediaQuery.of(context).size.width * .10,
                  right: screenWidth >= 1400
                      ? 0
                      : MediaQuery.of(context).size.width * .10,
                  bottom: 100),
              decoration: BoxDecoration(
                color: Color(0xFFECF0F3),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      AppTitle('MY SKILLS', 50, 0.05),
                      AppTitle('MY SKILLS', 35, 0.8),
                    ],
                  ),
                  Container(width: 100, height: 2, color: AppColors.yellow),
                  const SizedBox(height: 3),
                  Container(width: 75, height: 2, color: AppColors.yellow),
                  const SizedBox(height: 50),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.spaceBetween,
                    children: SKILLS.map(_buildSkill).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      tabletScreen: Container(
        padding: EdgeInsets.symmetric(vertical: 100),
        color: Color(0xFFECF0F3),
        child: Column(
          children: [
            AboutSection.aboutImage(screenWidth >= 850 ? 750 : 600,
                screenWidth >= 850 ? 750 : 600, menImage),
            SizedBox(
              height: screenWidth >= 850 ? 60 : 40,
            ),
            AboutSection.aboutMe(
                screenWidth >= 850 ? 310 : 290,
                screenWidth >= 850 ? 750 : 600,
                _description,
                screenWidth >= 850 ? 19 : 17),
            SizedBox(
              height: screenWidth >= 850 ? 60 : 40,
            ),
            AboutSection.aboutButtons(
                180,
                screenWidth >= 850 ? 750 : 600,
                20,
                0,
                AboutSection.Button(
                    60, 200, 'VIEW RESUME', 20, () {}, () {}, () {}, isHover),
                AboutSection.Button(
                    60, 200, 'HIRE ME NOW', 20, () {}, () {}, () {}, isHover1),
                MainAxisAlignment.start),
            const SizedBox(height: 70),
            Container(
              width: screenWidth >= 850 ? 750 : 600,
              decoration: BoxDecoration(
                color: Color(0xFFECF0F3),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
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
                  const SizedBox(height: 35),
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
      // ],

      mobileScreen: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        color: Color(0xFFECF0F3),
        child: Column(
          children: [
            AboutSection.aboutImage(
                screenWidth * .9, screenWidth * .9, menImage),
            SizedBox(height: 30),
            AboutSection.aboutMe(380, screenWidth * .9, _description, 14),
            SizedBox(height: 30),
            Container(
              height: 230,
              width: screenWidth * .9,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFFe2e8ec)],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment:screenWidth>=1400?MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View my curriculum vitae:",
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Color(0xFF3C3E41)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AboutSection.Button(
                      50, 170, 'VIEW RESUME', 16, () {}, () {}, () {}, isHover),
                  SizedBox(
                    height: 20,
                  ),
                  AboutSection.Button(50, 170, 'HIRE ME NOW', 16, () {}, () {},
                      () {}, isHover1),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Container(
              width: screenWidth * .9,
              decoration: BoxDecoration(
                color: Color(0xFFECF0F3),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
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
                  const SizedBox(height: 35),
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
  }

  void _downloadCV() {
    launch(AppConstants.cv);
  }

  // Widget _buildSkill(Skill skill) => Container(
  Widget _buildSkill(Skill skill) => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFe2e8ec)],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                offset: Offset(-5, -5),
              ),
              BoxShadow(
                  color: Color(0xFFD1D9E6),
                  blurRadius: 15,
                  offset: Offset(5, 5)),
            ]),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Text(skill.name!),
      );
}
