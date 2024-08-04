import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  const CustomAppbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.bakgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Center(
            child: Text(
              textAlign: TextAlign.start,
              title,
              style: AppTextStyle.title,
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
