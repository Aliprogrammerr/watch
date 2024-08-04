import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/data/model/product.dart';
import 'package:flex/data/controller/homeScreenController.dart';
import 'package:flex/screnns/product_List/productList.dart';
import 'package:flex/widget/AppSlider.dart';
import 'package:flex/widget/homeTiteProduct.dart';
import 'package:flex/widget/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class HomeNavigation {
  HomeNavigation._();
  static const trendTarin = 0;
  static const mostWatch = 1;
}


class _HomeScreenState extends State<HomeScreen> {
  var homeScreenController = Get.find<HomeScreenController>();
  int? selectedIndex = HomeNavigation.trendTarin;
  @override
  Widget build(BuildContext context) {
    homeScreenController.getHomeItems();
    var size = MediaQuery.of(context).size;
    var isActive = false;
  return SingleChildScrollView(
      child: Column(
        children: [  
        InkWell(
          onTap: () => Get.to(HomeScreen()),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimens.large),
            height: size.height * .07,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 65, 65, 65),
                borderRadius: BorderRadius.circular(AppDimens.medium)),
            child: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.search),
                SizedBox(width: 40,), 
                Text(
                  AppStrings.textFeildTEext,
                  style: AppTextStyle.title,
                ),
              ],
            ),
          ),
        ),
        AppSlider(imgList: homeScreenController.sliders,),
       const SizedBox(height: 10,),
        SizedBox(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
          child: Container(
            width: size.width,
            height: 960,
            color: MyColors.homePagebg,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: size.width * .8,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: [
                      TitleProductbtn(
                          text: AppStrings.mostWatch,
                          width: size.width * .4,
                          isActive: selectedIndex == HomeNavigation.mostWatch,
                          ontap: () => homeProductTitle(
                              index: HomeNavigation.mostWatch)),
                      TitleProductbtn(
                          text: AppStrings.trendTarin,
                          width: size.width * .4,
                          isActive: selectedIndex == HomeNavigation.trendTarin,
                          ontap: () => homeProductTitle(
                              index: HomeNavigation.trendTarin)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IndexedStack(
                  index: selectedIndex,
                  children:  [
                    SizedBox(
                      height: 880,
                      child: ProductList(
                        products: homeScreenController.amazingproducts,
                      ),
                    ),
                    SizedBox(
                      height: 880,
                      child: ProductList(
                        products: homeScreenController.mostsellerproducts,
                      ),
                    ),
                  ],
                ),
                          ],
            ),
          )  ,
           ),
        ),
       ],
          ),
    
  );
  }

  homeProductTitle({required index}) {
    setState(() {
      selectedIndex = index;
    });
  }
} 


