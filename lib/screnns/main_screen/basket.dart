import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/screnns/widgets/AppBtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 52, 52, 52),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 18),
              width: size.width,
              height: size.height,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => const ProductInCart(),
              )),

        Positioned(
          bottom: 200,
          right: 30,
          left: 30,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            AppButton(width: size.width * .4, ontap: (){}, text: AppStrings.clear),
            Text("final 3222",style: AppTextStyle.title,),
          ],
        ))
        ],
      ),
    );
  }
}

class ProductInCart extends StatelessWidget {
  const ProductInCart({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(9),
      width: size.width * .6,
      height: size.height * .17,
      decoration: const BoxDecoration(
          color: MyColors.blackColor,
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.small))),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  width: 130,
                  "assets/png/pexels-castorlystock-3829441.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
          
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25,),
                  Text("title is the titile  name",style: AppTextStyle.title,),
                  const SizedBox(height: 5,),
                  Text("price",style: AppTextStyle.productPrice,),
                  Text("discout",style: AppTextStyle.productPrice,),
                ],
              ),
              
            ],
          ),
          Positioned(
            bottom: 10,
            right :300,
            left: 0,

            child: Icon(Icons.delete))
        ],
      ),
    );
  }
}
