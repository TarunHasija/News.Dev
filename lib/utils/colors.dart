import 'package:flutter/material.dart';

class AppColors {
  static Color primary = Colors.deepPurple.shade500;
  static Color lightWhite = Colors.grey.shade100;
  static const Color bgColor = Color(0xff0d0d0d);
  static Color black = Colors.black;
  static Color border = const Color.fromARGB(255, 93, 93, 93);
  static Color white = Colors.white;

  static Color lightgrey = Colors.grey.shade500;
  static Color darkgrey = Colors.grey.shade900;
 static LinearGradient shadow = const LinearGradient(colors: [
    Colors.black,
    Colors.transparent,
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
}
