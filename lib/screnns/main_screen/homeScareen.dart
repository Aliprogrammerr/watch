import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
     return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: AppDimens.large),
              height: size.height*.07,
              decoration: BoxDecoration(
              color: MyColors.apptextFeildColor,
              borderRadius: BorderRadius.circular(AppDimens.medium)
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.search),
                  SizedBox(width: 40,),
                  Text(AppStrings.textFeildTEext,style: AppTextStyle.title,),
                ],
              ),
            ),
          )
          
        ],
      ),);

  }
}