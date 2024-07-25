// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../constant/AppColors.dart';


class AppTextStyle {
  AppTextStyle._();
  static const TextStyle splashText = TextStyle(
      fontFamily: "anjoman",
      fontSize: 22,
      color: MyColors.title,
      fontWeight: FontWeight.w600);
  static const TextStyle btnText = TextStyle(
      fontFamily: "anjoman",
      fontSize: 14,
      color: MyColors.blackColor,
      fontWeight: FontWeight.w800);
  static const TextStyle title = TextStyle(
    color: MyColors.title,
    fontFamily: "dana",
    fontSize: 16,
  );
  static const TextStyle hint = TextStyle(
    fontFamily: "dana",
    fontSize: 16,
    color: MyColors.hintColor,
  );
  static const TextStyle editNumber = TextStyle(
    fontFamily: "dana",
    fontSize: 14, 
    color: MyColors.editNumber,
    fontWeight: FontWeight.w500
  );
  static const TextStyle productitle1= TextStyle(
    color: MyColors.blackColor,
    fontFamily: "anjoman",
    fontSize: 16,
    fontWeight: FontWeight.w700
  );
  static const TextStyle productitle2= TextStyle(
     color: MyColors.title,
    fontFamily: "anjoman",
    fontSize: 16,
    fontWeight: FontWeight.w700
  );
  static const TextStyle productTitle = TextStyle(
    color: MyColors.title,
    fontFamily: "anjoman",
    fontSize: 15,
    fontWeight: FontWeight.w400 
  );
  static const TextStyle productPrice = TextStyle(
    color: MyColors.title,
    fontFamily: "anjoman",
    fontSize: 15,
  );
  static const TextStyle productPriceDiscount = TextStyle(
    color: MyColors.title,
    fontFamily: "anjoman",
    fontSize: 12,
    decoration: TextDecoration.lineThrough
  );
  static const TextStyle timer = TextStyle(
    fontFamily: "anjoman",
    fontSize: 18,
    color: MyColors.blackColor , 
    fontWeight: FontWeight.w600

  );
}
