import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constant/AppColors.dart';
import '../../constant/Strings.dart';
import '../../constant/dimens.dart';
import '../widgets/registerScreen_Widgets/AppBtn.dart';
import '../widgets/registerScreen_Widgets/Logo.dart';
import '../widgets/registerScreen_Widgets/appTextFeild.dart';


class SendSmsScreen extends StatelessWidget {
  const SendSmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyColors.bakgroundColor,
        body: Column(
          children: [
            const SizedBox(height: 50,),
            Logo(),
            const SizedBox(height: 60,),
            Container(
              width: size.width * .85,
              height: size.height * .3,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppDimens.medium)),
                color: MyColors.registerBoxBg,
              ),
              child: Column(
                children: [
                  const AppTextFeild(
                    title: AppStrings.putYourNumber,
                    hint: AppStrings.numberHint,
                    type: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppButton(
                      text: AppStrings.next,
                      width: size.width * .2,
                      ontap: () {})
                ],
              ),
            )
          ],
        ));
  }
}

