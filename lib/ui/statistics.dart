import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/projects.dart';
import 'responsive_widget.dart';
import 'icon.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        height: 300,
        decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
            // image: DecorationImage(image: AssetImage("images/footer_bg.jpg"),fit: BoxFit.fill)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
             _buildStatistic(
              context, 'icons/briefcase.png', '2+', 'Experience',),
             _buildStatistic(context, 'icons/menu.png', '${PROJECTS.length}+',
              'Projects',),
             _buildStatistic(context, 'icons/happy.png', '50+', 'Clients',),
            _buildStatistic(context, 'icons/coffee.png', '∞', 'Coffee Cups',),
        ]),
      ),
      mobileScreen: Container(
        decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
          // image: DecorationImage(image: AssetImage("images/footer_bg.jpg"),fit: BoxFit.fill)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ), 
        child: Column(
          children: [
            _buildStatistic(
                context, 'icons/briefcase.png', '2+', 'Experience',),
            const SizedBox(height: 50),
            _buildStatistic(context, 'icons/menu.png', '${PROJECTS.length}+',
                'Projects',),
            const SizedBox(height: 50),
            _buildStatistic(context, 'icons/happy.png', '50+', 'Clients',),
            const SizedBox(height: 50),
            _buildStatistic(context, 'icons/coffee.png', '∞', 'Coffee Cups', ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic(
      BuildContext context, String icon, String total, String description, ) {
    return ResponsiveWidget(
      desktopScreen: Container(
        // width:MediaQuery.of(context).size.width * .17,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon, size: 45),
            const SizedBox(height: 5),
            Text(
              total,
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description.toUpperCase(),
              style:GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,letterSpacing: 5,
              ),
            ),
          ],
        ),
      ),
      mobileScreen: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon, size: 35),
            const SizedBox(height: 5),
            Text(
              total,
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style:GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,letterSpacing:5
              )
            ),
          ],
        ),
      ),
    );
  }
}
