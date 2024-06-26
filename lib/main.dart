import 'package:flex/route/pages.dart';
import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/Register/SendSmsScreen.dart';
import 'package:flex/screnns/Register/SplashScreen.dart';
import 'package:flex/screnns/Register/register/cubit/register_cubit.dart';
import 'package:flex/screnns/main_screen/main_screen.dart';
import 'package:flex/themes/AppThemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


 Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) =>RegisterCubit(),
      child:  GetMaterialApp(
        getPages: Pages.pages,
        locale: const Locale("fa"),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.darkTheme,
        home:
        MainScreen()
        //    BlocBuilder<RegisterCubit,RegisterState>(builder:(context,state){
        //   if(state is LogOut){
        //     return  Splashscreen();
        //   }
        //   else if(state is LogIn){
        //     return const MainScreen();
        //   }
        //   else {
        //     return  Splashscreen();
        //   }
        // }),
           ),
     );
  }
}
