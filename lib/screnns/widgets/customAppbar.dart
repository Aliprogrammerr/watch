
import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        SizedBox(width: 10,),
        Text(title , style: AppTextStyle.title,),
        Image.asset("assets/png/logo-color.png",width: 70,),
        ],) ,
    
    );
  }
  
  @override
  Widget get child => throw UnimplementedError();
  
  @override
  Size get preferredSize => Size.fromHeight(60);
}