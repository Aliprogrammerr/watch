
import 'package:flex/route/pages.dart';
import 'package:flex/screnns/Auth/auth/auth_cubit.dart';
import 'package:flex/screnns/main_screen/mianPage.dart';
import 'package:flex/themes/AppThemes.dart';
import 'package:flex/utils/SharedPrefernce_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


 Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPerfencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=> AuthCubit()),
      ],
      child:  GetMaterialApp(
        getPages: Pages.pages,
        locale: const Locale("fa"),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.darkTheme,
        home:const MainScreen()));
    //        BlocBuilder<RegisterCubit,RegisterState>(builder:(context,state){
    //       if(state is LogOut){
    //         return   const MainScreen();
    //       }
    //       else if(state is LogIn){
    //         return const MainScreen();
    //       }
    //       else {
    //         return  const Splashscreen();
    //       }
    //     }
        
    //     ),
    //        ),
    //  );
  }
}
