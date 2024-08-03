// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class modifiedText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const modifiedText({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.lato(color: color,fontSize: size.w),);
  }
}


class boldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const boldText({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.lato(color: color,fontSize: size.w,fontWeight: FontWeight.bold),);
  }
}
