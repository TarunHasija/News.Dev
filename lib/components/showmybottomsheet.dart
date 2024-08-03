// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:techdev/utils/utils.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void showMyBottomSheet(BuildContext context, String title, String description,
    String imageurl, String url) {
  showBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only()),
      context: context,
      builder: (context) {
        return MyBottomSheet(
            imageurl: imageurl,
            description: description,
            title: title,
            url: url);
      });
}

class MyBottomSheet extends StatelessWidget {
  final String title;
  final String url;
  final String description;
  final String imageurl;
  const MyBottomSheet(
      {super.key,
      required this.imageurl,
      required this.description,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(
            imgurl: imageurl,
            title: title,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: modifiedText(
                text: description, size: 14.sp, color: AppColors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Read Full article',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(url);
                    },
                    style: GoogleFonts.lato(color: Colors.blue.shade400)
                    )
            ])),
          )
        ],
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imgurl;
  final String title;

  const BottomSheetImage({
    super.key,
    required this.imgurl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(gradient: AppColors.shadow),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(imgurl), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 10,
              child: Container(
            padding: EdgeInsets.all(10),
            width: 300.w,
            child: boldText(text: title, size: 16.sp, color: AppColors.white),
          ))
        ],
      ),
    );
  }
}
