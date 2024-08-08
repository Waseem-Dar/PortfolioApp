import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/projects.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class MyProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      tabletScreen: Container(),
      desktopScreen: Container(
        // color: Colors.black.withOpacity(0.9),
        color: AppColors.greyLight,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AppTitle('MY PROJECTS', 50, 0.05),
                AppTitle('MY PROJECTS', 35, 0.8),
                // Text('MY PROJECTS', style: AppStyles.title),
              ],
            ),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            ...PROJECTS.map((p) => _buildProject(context, p)).toList(),
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.greyLight,
        // color: Colors.black.withOpacity(0.9),
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
              children: PROJECTS.map((p) => _buildProject(context, p)).toList(),
              spacing: 5,
              runSpacing: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) =>
      ResponsiveWidget(
        tabletScreen: Container(),
        desktopScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .75,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color:Colors.red,
                    height: MediaQuery.of(context).size.width * .3,
                    width: MediaQuery.of(context).size.width * .3,
                    child: Image.asset(project.image!,fit: BoxFit.cover,),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .070),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.name!, style: GoogleFonts.poppins(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.black87)),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.description!, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: project.skills!
                              .map((s) => Chip(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              side: BorderSide(color: Colors.grey.withOpacity(0.1),width: 1),
                              surfaceTintColor: Colors.transparent,
                              shape: StadiumBorder(),
                              label: Text(s, style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13))))
                              .toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // launch(project.url!);
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

                          child: Text('Code',style:TextStyle(color: AppColors.yellow)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 20,
                thickness: 1,
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
                child: Image.asset(project.image!),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .075),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(project.name!, style: AppStyles.title),
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
                children:
                    project.skills!.map((s) => Chip(
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        side: BorderSide.none,
                        surfaceTintColor: Colors.transparent,
                        shape: StadiumBorder(),
                        label: Text(s))).toList(),
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

                child: Text('Visit',style: TextStyle(color: AppColors.yellow),),
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 50,
                thickness: 1,
              ),
            ],
          ),
        ),
      );
}
