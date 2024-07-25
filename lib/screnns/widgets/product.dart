






import 'dart:async';

import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/compunents/expamntion.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
        required this.price,
    required this.productName,
     this.dicount = 0 ,
     this.oldPrice = 9 ,
     this.timer  = 0 ,
    });

  final int price ;
  final String productName;
  final int oldPrice;
  final int dicount;
  final int timer ;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: MyColors.apptextFeildColor,
          borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.medium))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              "assets/png/pexels-castorlystock-3829441.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              productName,
              style: AppTextStyle.productTitle,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Visibility(
                  visible:dicount>0 ? true : false,
                  child: Container(
                    width: 40,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Center(
                      child: Text(
                        "$dicount",
                        style: AppTextStyle.title
                            .copyWith(color: MyColors.blackColor),
                      ),
                    ),
                  ),
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${price.seperateWithComma} تومان",
                      style: AppTextStyle.productPrice,
                    ),
                                    Visibility(
                    visible: dicount > 0 ? true : false  ,
                    child: Text(price.seperateWithComma,style:AppTextStyle.productPriceDiscount))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              height: 30,
              decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(25))),
              child:  Center(
                  child: Text(timer.toString(),
                style: AppTextStyle.timer,
              )),
            ),
          )
        ],
      ),
    );
  }
}
