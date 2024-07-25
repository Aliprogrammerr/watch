// ignore_for_file: file_names
import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/widgets/AppSlider.dart';
import 'package:flex/screnns/widgets/homeTiteProduct.dart';
import 'package:flex/screnns/widgets/product.dart';
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

List<String> imageListb = [
  "assets/png/jutta-wilms-a0r2nyk31SE-unsplash.jpg",
  "assets/png/pexels-the-5th-50003-179909.jpg",
  "assets/png/pexels-castorlystock-3829441.jpg"
];

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex = HomeNavigation.trendTarin;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isActive = false;
    return SingleChildScrollView(
        child: Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(NamedRoute.searchPage);
          },
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
                SizedBox(
                  width: 40,
                ),
                Text(
                  AppStrings.textFeildTEext,
                  style: AppTextStyle.title,
                 ),
                ],
              ),
            ),
            ),
            const SizedBox(height: 10,),
          AppSlider(imgList: imageListb),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.large ),
          child: Container(
            width: size.width,
            height: 500,
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
                        text:  AppStrings.mostWatch,
                          width : size.width *.4,
                          isActive: selectedIndex == HomeNavigation.mostWatch,
                          ontap: () => homeProductTitle(
                              index: HomeNavigation.mostWatch)),
                      TitleProductbtn(
                        text: AppStrings.trendTarin,
                          width : size.width *.4,
                          isActive: selectedIndex == HomeNavigation.trendTarin,
                          ontap: () => homeProductTitle(
                              index: HomeNavigation.trendTarin)),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                IndexedStack(
                  index: selectedIndex,
                  children: const [
                    // first Page
                    SizedBox(
                      height: 420,
                      child: ProductList(),),
                   //second page
                      SizedBox(
                      height: 420,
                      child: ProductList(),),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
  homeProductTitle({required index}) {
    setState(() {
      selectedIndex = index;
    });
  }
}


class ProductList extends StatelessWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: SizedBox(
        height:1000,
        child: GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            childAspectRatio:.7,
            ),
          itemBuilder: (context , index){
            return Product(price: 2000,productName: "dfs",);
          }),
      ),);
  }
}

