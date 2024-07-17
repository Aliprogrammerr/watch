import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/constant/images.dart';
import 'package:flex/screnns/main_screen/basket.dart';
import 'package:flex/screnns/main_screen/homeScareen.dart';
import 'package:flex/screnns/main_screen/profileScreen.dart';
import 'package:flex/screnns/main_screen/widgets/BottomNavItem.dart';
import 'package:flutter/material.dart';

class BtnNaivgationScreem {
  BtnNaivgationScreem._();
  static const shop = 0;
  static const home = 1;
  static const profile = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? selectedIndex = BtnNaivgationScreem.home;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.bakgroundColor,
      
      body: Stack(
        children: [
          Positioned(
            top:0,
            left:10,
            right:10,
            child:Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Images.store,
                color: MyColors.iconColor, width: size.width * .1),
            Image.asset(
              Images.logo,
              width: size.width * .1,
            ),
          ],
        ),
      ),
      ),
          Positioned(
            top: 70,
            right:0,
            left: 0,
            child:IndexedStack(
              index: selectedIndex,
              children: [
                Bakstet(),
                HomeScreen(),
                Profile()
              ],
            )
          
            ),
       
          Positioned(
              bottom: 5,
              right: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: size.height * .08,
                decoration: const BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppDimens.medium))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem(
                      ontap: () =>
                          bottomNavOntap(index: BtnNaivgationScreem.shop),
                      icon: Icons.store,
                      isAtice: selectedIndex == BtnNaivgationScreem.shop,
                    ),
                    BottomNavItem(
                        ontap: () =>
                            bottomNavOntap(index: BtnNaivgationScreem.home),
                        icon: Icons.home,
                        isAtice: selectedIndex == BtnNaivgationScreem.home),
                    BottomNavItem(
                        ontap: () =>
                            bottomNavOntap(index: BtnNaivgationScreem.profile),
                        icon: Icons.person,
                        isAtice: selectedIndex == BtnNaivgationScreem.profile)
                  ],
                ),
              ))
        ],
      ),
    ));
  }

  bottomNavOntap({required index}) {
    setState(() {
      selectedIndex = index;
    });
  }
}
