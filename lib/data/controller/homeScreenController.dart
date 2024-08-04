import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flex/data/model/product.dart';
import 'package:flex/data/model/slide.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController  {
  RxList<Slide> sliders = RxList();
  RxList<Product> amazingproducts = RxList();
  RxList<Product> mostsellerproducts = RxList();
  RxList<Product> newestproducts = RxList() ;

  @override
  void onInit() {
    getHomeItems();
    super.onInit();
  }
     final Dio dio = Dio();

   getHomeItems() async {
     var response = await dio.get(EndPoint.home);

    if (response.statusCode ==200){
      response.data["data"]["sliders"].forEach((element){
        sliders.add(Slide.fromJson(element));
      });
      // response.data["data"]["categories"].forEach((element){
      //   categories.add(Category.fromJson(element));
      // });
      response.data["data"]["amazing_products"].forEach((element){
        amazingproducts.add(Product.fromJson(element));
      });
      response.data["data"]["most_seller_products"].forEach((element){
        mostsellerproducts.add(Product.fromJson(element));
      });
      response.data["data"]["newest_products"].forEach((element){
        newestproducts.add(Product.fromJson(element));
      });

    }

   
   }

}