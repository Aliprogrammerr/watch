import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/compunents/expamntion.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/data/model/product_dirtail.dart';
import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/product_Ditail/producDitail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.price,
    required this.productName,
    required this.image,
    required this.dicount ,
    required this.discountPrice,
    required this.id,
 
});
  final int id;
  final int price;
  final String productName;
  final int discountPrice;
  final int dicount;
  final String image;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder:(context)=> ProductDitailScreen(id:id))),
      child: Container(
        decoration: const BoxDecoration(
            color: MyColors.productColor,
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.medium))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  image,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                productName,
                style: AppTextStyle.productTitle,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    // visible: dicount > 0 ? true : false,
                    child: Container(
                      width: 40,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Center(
                        child: Text(
                          "$dicount%",
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
                        "${discountPrice.seperateWithComma} تومان",
                        style: AppTextStyle.productPrice,
                      ),
                      Visibility(
                          visible: dicount > 0 ? true : false,
                          child: Text(price.seperateWithComma,
                              style: AppTextStyle.productPriceDiscount))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
