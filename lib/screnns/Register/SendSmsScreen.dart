
// ignore_for_file: file_names
import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/Register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constant/AppColors.dart';
import '../../constant/Strings.dart';
import '../../constant/dimens.dart';
import '../widgets/AppBtn.dart';
import '../widgets/Logo.dart';
import '../widgets/appTextFeild.dart';


class SendSmsScreen extends StatelessWidget {
   SendSmsScreen({super.key});
    final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyColors.bakgroundColor,
        body: Column(
          children: [
            const SizedBox(height: 50,),
            const Logo(),
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
                   AppTextFeild(
                    controller:_controller,
                    title: AppStrings.putYourNumber,
                    hint: AppStrings.numberHint,
                    type: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 
                  BlocConsumer<RegisterCubit,RegisterState>(
                    listener:(context, state) {
                      if(state is SentState){ 
                  // Navigator.pushNamed(context,NamedRoute.getsmsScreen,arguments:state.mobile );
                        Get.toNamed(NamedRoute.getsmsScreen,arguments: state.mobile);
                      }else if(state is ErrorState){}
                    },
                    builder:(context,state){
                      if(state is LoadingState){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );}
                      return  AppButton( 
                        text: AppStrings.next,
                        width: size.width * .2,
                        ontap: () {
                         BlocProvider.of<RegisterCubit>(context).sendSms(_controller.text);
                        });
                    }
                  )
                ],
              ),
            )
          ],
        ));
  }
}

