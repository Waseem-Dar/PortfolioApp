import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/ui/responsive_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/colors.dart';
import '../config/styles.dart';
import 'icon.dart';

class WorkingProcess extends StatefulWidget {
  @override
  State<WorkingProcess> createState() => _WorkingProcessState();
}

class _WorkingProcessState extends State<WorkingProcess> {
  List<bool> isHoverList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final Uri planUri = Uri.parse("https://kissflow.com/application-development/application-development-planning/");
    final Uri designUri = Uri.parse("https://nandbox.com/how-to-design-a-great-mobile-app-without-hiring-a-designer-an-entry-level-guide/");
    final Uri codeUri = Uri.parse("https://docs.flutter.dev/");
    return ResponsiveWidget(
      desktopScreen: Container(
        color: Color(0xFFECF0F3),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1,
          vertical: 100,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AppTitle("WORKING PROCESS", 50, 0.05),
                AppTitle("WORKING PROCESS", 35, 0.8),
              ],
            ),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: __buildProcess(
                    context,
                    Color(0xFF7a1be7),
                    'icons/pencil.png',
                    'Plan',
                    'Understanding project requirements, conducting research, and creating a roadmap to ensure successful app development',
                    100,
                    "images/bg1.png",
                    "Project Roadmap",
                    planUri,
                    "View plan",
                    0,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: __buildProcess(
                    context,
                    Color(0xFFff2d7f),
                    'icons/design.png',
                    'Design',
                    'Crafting intuitive and visually appealing user interfaces, focusing on user experience and accessibility.',
                    100,
                    "images/bg2.png",
                    "UI / User Experience",
                    designUri,
                    "Learn more",
                    1,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: __buildProcess(
                    context,
                    Color(0xFF0055ff),
                    'icons/coding.png',
                    'Code',
                    'Implementing the design into functional code using Flutter, adhering to best practices and ensuring performance optimization.',
                    100,
                    "images/bg3.png",
                    "Flutter Implementation",
                    codeUri,
                    "Read docs",
                    2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      mobileScreen: Container(
        color: Color(0xFFECF0F3),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .10,
          vertical: 50,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AppTitle("WORKING PROCESS", 33, 0.05),
                AppTitle("WORKING PROCESS", 20, 0.8),
              ],
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            __buildProcess(
              context,
              Color(0xFF7a1be7),
              'icons/pencil.png',
              'Plan',
              'Understanding project requirements, conducting research, and creating a roadmap to ensure successful app development.',
              80,
              "images/bg1.png",
              "Project Roadmap",
              planUri,
              "View plan",
              0,
            ),
            const SizedBox(height: 20),
            __buildProcess(
              context,
              Color(0xFFff2d7f),
              'icons/design.png',
              'Design',
              'Crafting intuitive and visually appealing user interfaces, focusing on user experience and accessibility.',
              80,
              "images/bg2.png",
              "UI / User Experience",
              designUri,
              "Learn more",
              1,
            ),
            const SizedBox(height: 20),
            __buildProcess(
              context,
              Color(0xFF0055ff),
              'icons/coding.png',
              'Code',
              'Implementing the design into functional code using Flutter, adhering to best practices and ensuring performance optimization.',
              80,
              "images/bg3.png",
              "Flutter Implementation",
              codeUri,
              "Read docs",
              2,
            ),
          ],
        ),
      ),
    );
  }
  Widget __buildProcess(
      BuildContext context,
      Color color,
      String iconPath,
      String title,
      String description,
      double height,
      String image,
      String title1,
      Uri uri,
      String bText,
      int index,
      ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xFFe2e8ec)],
          begin: Alignment.bottomRight, end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white,blurRadius: 10, offset: Offset(-5, -5),
          ),
          BoxShadow(
            color: Color(0xFFD1D9E6), blurRadius: 15, offset: Offset(5, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: AppIcon(iconPath, color: color, size: 20),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              title1,
              style: GoogleFonts.montserrat(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: height,
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  color: Color(0xFF3c3e41),
                  fontSize: 13,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 0.5,
              thickness: 0.5,
            ),
            InkWell(
              onTap: () {
                _launchUrl(uri);
              },
              hoverColor: Colors.transparent,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.only(top: 15, right: isHoverList[index] ? 5 : 15),
                child: MouseRegion(
                  onEnter: (_) => setState(() => isHoverList[index] = true),
                  onExit: (_) => setState(() => isHoverList[index] = false),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bText,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: color,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                // decoration: BoxDecoration(
                //   color: isHoverList[index] ? color : Colors.white,
                //   borderRadius: BorderRadius.circular(10),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
