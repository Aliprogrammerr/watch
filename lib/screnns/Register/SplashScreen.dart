// ignore_for_file: file_names

import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/route/routeNames.dart';
import 'package:flex/widget/AppBtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../constant/Strings.dart';
import '../../constant/dimens.dart';



class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/png/splashScreen.jpg",
                    ),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.large),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    AppStrings.splashText,
                    style: AppTextStyle.splashText,
                  ),
                  const SizedBox(
                    height: AppDimens.large,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: AppButton(
                          text: AppStrings.next,
                          width: size.width * .25,
                          ontap: () {
                            Get.toNamed(
                              NamedRoute.sendSmsScreen,
                            );
                          })),
                  const SizedBox(
                    height: AppDimens.large,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
