import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techdev/components/components.dart';
import 'package:techdev/utils/utils.dart';

class Newsbox extends StatelessWidget {
  final String url;
  final String title;
  final String time;
  final String description;
  final String imageurl;
  const Newsbox(
      {super.key,
      required this.url,
      required this.title,
      required this.time,
      required this.description,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: sw,
            color: AppColors.black,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.darkgrey,width: 2)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageurl,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 64.w,
                      height: 64.w,
                      decoration: BoxDecoration(
                        
                          image: DecorationImage(
                            
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow),
                    ),
                    placeholder: (context, url) {
                      return CircularProgressIndicator(
                        color: AppColors.white,
                      );
                    },
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        modifiedText(
                            text: title, size: 14, color: AppColors.lightWhite),
                        SizedBox(height: 5.h,),
                        boldText(text: time, size: 11, color: AppColors.lightgrey)
                      ],
                    ))
              ],
            ),
          ),
        ),
        dividerWidget()
      ],
    );
  }

  Container dividerWidget() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Divider());
  }
}
