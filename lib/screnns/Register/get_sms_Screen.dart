// ignore_for_file: file_names

import 'dart:async';

import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/Register/cubit/register_cubit.dart';
import 'package:flex/screnns/widgets/Register_Widgets/AppBtn.dart';
import 'package:flex/screnns/widgets/Register_Widgets/Logo.dart';
import 'package:flex/screnns/widgets/Register_Widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class GetSmsScreen extends StatefulWidget {
  GetSmsScreen({super.key});

  @override
  State<GetSmsScreen> createState() => _GetSmsScreenState();
}

class _GetSmsScreenState extends State<GetSmsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
startTimer();
    super.initState();
  }

  late Timer _timer;
  int _start = 120;

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _timer.cancel();
          Get.back();
        } else {
          _start--;
        }
      });
    });
  }
  String formatTime(int sec){
    int min = sec ~/ 60;
    int seconds = sec % 60 ; 

    String minStr = min.toString().padLeft(2,"0");
    String secStr = seconds.toString().padLeft(2,"0");
    return "$minStr:$secStr";
  }


  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.bakgroundColor,
      body: SingleChildScrollView(
        child: Column(
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppDimens.large),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(_start)),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Text(
                            AppStrings.editNumber,
                            style: AppTextStyle.editNumber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      _timer.cancel();
                      if (state is VerifiedNotRegistered) {
                        Get.toNamed(NamedRoute.authitication);
                      } else if (state is VerifiedIsRegistered) {
                        Get.toNamed(NamedRoute.mainScreen);
                      }
                      else if(state is ErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is an eror man")));
                      }
                    },
                    builder: (context, state) {
                         if(state is LoadingState){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                      } 
                        return AppButton( 
                            text: AppStrings.next,
                            width: size.width * .2,
                            ontap: () {
                              BlocProvider.of<RegisterCubit>(context).varifyCode(mobileRouteArg, _controller.text);
                            });
                      
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
