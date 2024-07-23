import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/Auth/auth/auth_cubit.dart';
import 'package:flex/screnns/main_screen/mianPage.dart';
import 'package:flex/screnns/widgets/Register_Widgets/AppBtn.dart';
import 'package:flex/screnns/widgets/Register_Widgets/Logo.dart';
import 'package:flex/screnns/widgets/Register_Widgets/appTextFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Authitication extends StatefulWidget {
  const Authitication({super.key});

  @override
  State<Authitication> createState() => _AuthiticationState();
}

class _AuthiticationState extends State<Authitication> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController adressController = TextEditingController();
    TextEditingController postalCodeController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.bakgroundColor,
      body:  Column(
              children: [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.medium),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                    //   AppButton(width: size.width *0.1, ontap: (){
                    //     Get.toNamed(NamedRoute.mainScreen);
                    //   }, text: "بعدا"),
                     TextButton(
                      onPressed: (){
                      Get.toNamed(NamedRoute.mainScreen);
                     }, child: const Text("بعدا",style:AppTextStyle.title,)),
                       const Logo(),
                     ],
                   ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.large),
                  child: BlocProvider(
                    create: (context) => AuthCubit(),
                    child: Column(
                      children: [
                        AppTextFeild(
                            controller: nameController,
                            hint: "",
                            title: "نام و نام خوانوادکی:",
                            type: TextInputType.name),
                        AppTextFeild(
                            controller: phoneController,
                            hint: "",
                            title: "شماره همراه:",
                            type: TextInputType.name),
                        AppTextFeild(
                            controller: adressController,
                            hint: "",
                            title: ": آدرس",
                            type: TextInputType.name),
                        AppTextFeild(
                            controller: postalCodeController,
                            hint: "",
                            title: "کد پستی",
                            type: TextInputType.name),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {},
                              child: AppTextFeild(
                                  controller: locationController,
                                  hint: "",
                                  title: "موقعیت مکانی",
                                  type: TextInputType.name),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppButton(
                            width: size.width * .85,
                            ontap: () {
                             Get.to(MainScreen());
                            },
                            text: AppStrings.next),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        
            
        
      
    );
  }
}
