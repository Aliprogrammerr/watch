import 'package:flex/route/routeNames.dart';
import 'package:flex/screnns/Auth/Authitication.dart';
import 'package:flex/screnns/main_screen/mianPage.dart';
import 'package:flex/screnns/Register/SplashScreen.dart';
import 'package:get/get.dart';
import '../screnns/Register/SendSmsScreen.dart';
import '../screnns/Register/get_sms_Screen.dart';

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
        page: () => SendSmsScreen()),
    GetPage(
        name: NamedRoute.getsmsScreen,
        page: () => GetSmsScreen(),
        transition: Transition.fade),
    GetPage(
      name: NamedRoute.authitication,
      page: () => const Authitication(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: NamedRoute.mainScreen,
      transition: Transition.fade,
      page: () => const MainScreen(),
      )
  ];
}
