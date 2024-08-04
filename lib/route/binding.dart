

import 'package:flex/data/controller/homeScreenController.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }

}