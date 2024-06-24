import 'package:flex/route/routeNames.dart';
import 'package:flex/view/Register/SplashScreen.dart';
import 'package:get/get.dart';
import '../view/Register/SendSmsScreen.dart';
import '../view/Register/get_sms_Screen.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>> pages = [
    GetPage(
        name: NamedRoute.initialRoute,
        page: () => const Splashscreen(),
        transition: Transition.fade),
    GetPage(
        transition: Transition.fadeIn,
        name: NamedRoute.sendSmsScreen,
        page: () => const SendSmsScreen()),
    GetPage(
        name:NamedRoute.getsmsScreen,
        page: ()=> const GetSmsScreen(),
        transition: Transition.fade),
  ];
}
