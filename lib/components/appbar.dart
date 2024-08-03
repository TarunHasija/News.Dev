import 'package:flutter/material.dart';
import 'package:techdev/utils/colors.dart';
import 'package:techdev/utils/text.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  appBar({super.key}) : preferredSize = Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      // elevation: 1,
      backgroundColor: AppColors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boldText(text: 'Tech.', size: 24, color: AppColors.primary),
          modifiedText(text: 'Dev', size: 24, color: AppColors.lightWhite)
        ],
      ),
    );
  }
}
