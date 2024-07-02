import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/screnns/Auth/auth/auth_cubit.dart';
import 'package:flex/screnns/Register/cubit/register_cubit.dart';
import 'package:flex/screnns/widgets/Register_Widgets/AppBtn.dart';
import 'package:flex/screnns/widgets/Register_Widgets/Logo.dart';
import 'package:flex/screnns/widgets/Register_Widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Authitication extends StatelessWidget {
  const Authitication({super.key});

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
      body: Column(
        children: [
          const Logo(),
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
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                         
                        },
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
                      ontap: () {},
                      text: AppStrings.next),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
