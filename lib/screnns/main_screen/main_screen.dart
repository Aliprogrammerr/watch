import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/screnns/widgets/Register_Widgets/AppBtn.dart';
import 'package:flex/screnns/widgets/Register_Widgets/Logo.dart';
import 'package:flex/screnns/widgets/Register_Widgets/appTextFeild.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();
    return SafeArea(child: 
    Scaffold(
      backgroundColor: MyColors.bakgroundColor,
      body:Column(

        children: [

          Logo(),
          Padding(
            padding: EdgeInsets.all(AppDimens.large),
            child: Column(
                children: [
                  AppTextFeild(controller: controller, hint: "", title: "نام و نام خوانوادکی:", type:TextInputType.name),
                  AppTextFeild(controller: controller, hint: "", title: "شماره همراه:", type:TextInputType.name),
                  AppTextFeild(controller: controller, hint: "", title: ": آدرس", type:TextInputType.name),
                  AppTextFeild(controller: controller, hint: "", title: "کد پستی", type:TextInputType.name),
                  AppTextFeild(controller: controller, hint: "", title: "موقعیت مکانی", type:TextInputType.name),
                  SizedBox(height: 20,),
                  AppButton(width: size.width * .85, ontap: (){}, text: AppStrings.next)
                ],
              ),
          )
        
           
        ],
      ) ,
      
    ));
  }
}