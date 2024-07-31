import 'package:flutter/material.dart';

import 'colors.dart';

mixin AppStyles {
  static final TextStyle title = TextStyle(
    color: AppColors.black.withOpacity(.8),
    fontSize: 35,
    fontWeight: FontWeight.w700,
  );
}
mixin AppStyles1 {
  static final TextStyle title = TextStyle(
    color: AppColors.black.withOpacity(.1),
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
}
Widget AppTitle(String title,double size,double opacity) {
  return Text(title,style: TextStyle(color: Colors.black.withOpacity(opacity),fontSize: size,fontWeight: FontWeight.bold),);
  // static final TextStyle title = TextStyle(
  //   color: AppColors.black.withOpacity(.1),
  //   fontSize: 50,
  //   fontWeight: FontWeight.bold,
  // );
}

Widget AppTitle1(String title,double size,double opacity) {
  return Text(title,style: TextStyle(color: Colors.white.withOpacity(opacity),fontSize: size,fontWeight: FontWeight.bold),);
  // static final TextStyle title = TextStyle(
  //   color: AppColors.black.withOpacity(.1),
  //   fontSize: 50,
  //   fontWeight: FontWeight.bold,
  // );
}
