// ignore_for_file: file_names

import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/Register/register/cubit/register_cubit.dart';
import 'package:flex/screnns/main_screen/main_screen.dart';
import 'package:flex/screnns/widgets/Register_Widgets/AppBtn.dart';
import 'package:flex/screnns/widgets/Register_Widgets/Logo.dart';
import 'package:flex/screnns/widgets/Register_Widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class GetSmsScreen extends StatelessWidget {
  GetSmsScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.bakgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Logo(),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: size.width * .85,
            height: size.height * .3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppDimens.medium)),
              color: MyColors.registerBoxBg,
            ),
            child: Column(
              children: [
                AppTextFeild(
                  controller: _controller,
                  title: AppStrings.getSmsText
                      .replaceAll(AppStrings.replace, mobileRouteArg),
                  hint: AppStrings.verifyCodeHint,
                  type: TextInputType.phone,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    AppStrings.editNumber,
                    style: AppTextStyle.editNumber,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is VerifiedNotRegisstered ){
                      Get.toNamed(NamedRoute.authitication);
                    }else if(state is VerifiedIsRegistered){
                      Get.toNamed(NamedRoute.mainScreen); 
                    }
                  },
                  builder: (context, state) {
                    if(state is LoadingState){
                      return const Center(child: CircularProgressIndicator(),);
                    } 
                  else {
                      return AppButton(
                        text: AppStrings.next,
                        width: size.width * .2,
                        ontap: () {
                          BlocProvider.of<RegisterCubit>(context).varifyCode(mobileRouteArg,_controller.text);

                        });

                  }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
