import 'dart:developer';

import 'package:flutter/material.dart';

// class ResponsiveWidget extends StatelessWidget {
//   final Widget? desktopScreen;
//   final Widget? tabletScreen;
//   final Widget? mobileScreen;
//
//   const ResponsiveWidget(
//       {Key? key, this.desktopScreen, this.tabletScreen, this.mobileScreen})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     if (screenWidth >= 1100) {
//       return desktopScreen ?? tabletScreen ?? mobileScreen!;
//     }
//     if (screenWidth >= 650) {
//       return tabletScreen ?? mobileScreen ?? desktopScreen!;
//     }
//
//     return mobileScreen ?? tabletScreen ?? desktopScreen!;
//   }
// }
// import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;
  const ResponsiveWidget(
      {Key? key, required this.desktopScreen, required this.tabletScreen, required this.mobileScreen})
      : super(key: key);
  // static bool isMobile(BuildContext context)=>
  //     MediaQuery.of(context).size.width < 650;
  // static bool isTablet(BuildContext context)=>
  //     MediaQuery.of(context).size.width < 900 &&
  //         MediaQuery.of(context).size.width >=650;
  // static bool isDesktop(BuildContext context)=>
  //     MediaQuery.of(context).size.width >= 900;
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth >= 1025){
          return desktopScreen;
        }
        else if(constraints.maxWidth >= 651 && constraints.maxWidth <=1024){
          return tabletScreen;
        }
        else{
          return mobileScreen;
        }
      },
    );
  }
}
