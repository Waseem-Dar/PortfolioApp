import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/main.dart';
import 'package:flutter_web_portfolio/widgets/about_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/styles.dart';
import 'responsive_widget.dart';
import '../data/projects.dart';
import '../config/colors.dart';

class MyProjects extends StatefulWidget {
  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  List<bool> isHoverList = List.generate(PROJECTS.length, (index) => false);
  List<bool> isHoverImageList = List.generate(PROJECTS.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      tabletScreen: Container(),
      desktopScreen: Container(
        color: Color(0xFFECF0F3),
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AppTitle('MY PROJECTS', 50, 0.05),
                AppTitle('MY PROJECTS', 35, 0.8),
              ],
            ),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            ...PROJECTS.asMap().entries.map((entry) => _buildProject(context, entry.value, entry.key)).toList(),
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.greyLight,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AppTitle('MY PROJECTS', 33, 0.05),
                AppTitle('MY PROJECTS', 20, 0.8),
              ],
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Wrap(
              children: PROJECTS.asMap().entries.map((entry) => _buildProject(context, entry.value, entry.key)).toList(),
              spacing: 5,
              runSpacing: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project, int index) =>
      ResponsiveWidget(
        tabletScreen: Container(),
        desktopScreen: Container(
          width: MediaQuery.of(context).size.width >= 1400 ? 1400 : 990,
          height: 240,
          margin: EdgeInsets.symmetric(vertical: 30),
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFe2e8ec)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(15),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isHoverImageList[index] = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isHoverImageList[index] = false;
                      });
                    },
                    child: Container(
                      height: 190,
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AnimatedScale(
                        scale: isHoverImageList[index] ? 1.1 : 1.0,
                        duration: Duration(milliseconds: 280),
                        child: Image.network(
                          project.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:70),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.name!,
                          style: GoogleFonts.montserrat(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E2125),
                          ),
                        ),
                        SizedBox(height:15),
                        Text(
                          project.description!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3c3e41),
                            fontSize: screenWidth >= 1400 ? 19 : 15
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height:25),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: project.skills!
                                .map((s) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Chip(
                                  backgroundColor:  Color(0xFFECF0F3),
                                  side: BorderSide(
                                    color: Colors.grey.withOpacity(0.1),
                                    width: 0.5,
                                  ),
                                  surfaceTintColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  label: Text(s,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12))),
                                ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 80,),
                  AboutSection.Button(
                    screenWidth>=1400?50:40,
                    screenWidth>=1400?140:120,
                    "CODE",
                    screenWidth>=1400?19:14,
                        () {
                      launch(project.url!);
                    },
                        () {
                      setState(()=>isHoverList[index] = true);
                    },
                        () {
                      setState(()=>isHoverList[index] = false);
                    },
                    isHoverList[index],
                  )
                ],
              ),
            ],
          ),
        ),
        mobileScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * .75,
                child: Image.network(project.image!),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .075,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(project.name!, style: GoogleFonts.poppins(fontSize: 28)),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(
                project.description!,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: project.skills!
                    .map((s) => Chip(
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  side: BorderSide.none,
                  surfaceTintColor: Colors.transparent,
                  shape: StadiumBorder(),
                  label: Text(s),
                )).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              OutlinedButton(
                onPressed: () {
                  launch(project.url!);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.yellow!.withOpacity(.5),
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Visit',
                  style: TextStyle(color: AppColors.yellow),
                ),
              ),
            ],
          ),
        ),
      );
}
