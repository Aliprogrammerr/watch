// ignore_for_file: file_names

import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flutter/material.dart';
import '../constant/AppColors.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: MyColors.borderColor, width: 2),
      borderRadius: BorderRadius.circular(AppDimens.medium),
    ),
    fillColor: MyColors.textFeildColor,
    filled: true,
    hintStyle: AppTextStyle.hint, 
    
  
  ));
  

}
