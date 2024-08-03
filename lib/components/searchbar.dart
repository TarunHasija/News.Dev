import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techdev/utils/colors.dart';

class SearchBox extends StatefulWidget {
  final Function onSearch;
  const SearchBox({super.key, required this.onSearch});

  static TextEditingController searchController = TextEditingController(text: '');

  // *did text : '' to provide a default empty string
  //*ot the api url so that when no search query then
  //* it should show all the news without any searchquery

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 60.h,
            // margin: const EdgeInsets.all(10),
            // padding: const EdgeInsets.only(left: 10),
            child: Center(
              child: TextField(
                controller: SearchBox.searchController,
                cursorColor: AppColors.border,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.darkgrey,
                    hintText: 'Search a Keyword or a Phrase',
                    hintStyle:
                        GoogleFonts.lato(color: AppColors.border, fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: AppColors.border,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.border, width: 2),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          )),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              widget.onSearch();
                
              // fetchNews();
              
            },
            child: Container(
              // color: AppColors.darkgrey,
              width: 55.w,
              height: 55.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border, width: 1.w),
                  color: AppColors.darkgrey,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.search,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
