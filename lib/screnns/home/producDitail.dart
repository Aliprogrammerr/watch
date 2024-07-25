

import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/screnns/widgets/AppBtn.dart';
import 'package:flex/screnns/widgets/customAppbar.dart';
import 'package:flex/screnns/widgets/homeTiteProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductDitail extends StatefulWidget {
   ProductDitail({
    super.key,this.title = "the titile of the product", this.icon = const SizedBox()});
   String title;
   Widget icon;

  @override
  State<ProductDitail> createState() => _ProductDitailState();
}
class DitailNavigation {
  DitailNavigation._();
  static const comments = 0;
  static const review = 1;
  static const features = 2;
}

class _ProductDitailState extends State<ProductDitail> {
  int? selectedIndex = DitailNavigation.features;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
        appBar: CustomAppbar(title: widget.title,),
        body : Container(
          color: MyColors.bakgroundColor,
          child: Stack(
            children: [
              Container(
                color: MyColors.homePagebg,
            margin: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          "assets/png/pexels-castorlystock-3829441.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text("this is title too",style: AppTextStyle.title,),
                      const SizedBox(height: 10,),
                      Container(
                        decoration: const BoxDecoration(
                          color: MyColors.bakgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        width: size.width * .9,
                        child: Row(
                          children: [
                            TitleProductbtn(
                                text: AppStrings.comments,
                                isActive: selectedIndex == DitailNavigation.comments,
                                ontap: () => ditailProductTitle(index: DitailNavigation.comments),
                                width: size.width *.3 ,
                            ),
                
                                TitleProductbtn(
                            text: AppStrings.features,
                            isActive: selectedIndex == DitailNavigation.features,
                            ontap: () => ditailProductTitle(index: DitailNavigation.features),
                            width: size.width *.3 ,
                        ),
                          TitleProductbtn(
                            text: AppStrings.review,
                            isActive: selectedIndex == DitailNavigation.review,
                            ontap: () => ditailProductTitle(index: DitailNavigation.review),
                            width: size.width *.3 ,
                        ),
                          ],
                        ),
                      ),
                      IndexedStack(
                        index: selectedIndex,
                        children: const [
                          Text("first"),
                          Text("seciod"),
                          Text("third"),
                        ],
                      ),
                   
                  ]
                ),
              ),
               Positioned(
                    bottom: 5,
                    right: 20,
                    left: 20,
                    child: Padding(
                          padding: EdgeInsets.symmetric(horizontal:AppDimens.medium),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                 AppButton(width: size.width *.4, ontap: (){}, text: AppStrings.addToCart),
                               const Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                   Text(
                                   "4100",
                                   // "${price.seperateWithComma} تومان",
                                   style: AppTextStyle.productPrice,
                                 ),
                                      Visibility(
                                 // visible: dicount > 0 ? true : false  ,
                                 child: Text(
                                   // price.seperateWithComma,
                                   "2199",
                                   style:AppTextStyle.productPriceDiscount))
                               ],
                             ),
                                          ],
                                        ),
                                 
                        ),
                  ),
            ],
          ),
        )

    );
    
  }

    ditailProductTitle({required index}) {
    setState(() {
      selectedIndex = index;
    });
  }
}