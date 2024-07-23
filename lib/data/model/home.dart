


import 'package:flex/data/model/Product.dart';
import 'package:flex/data/model/banner.dart';
import 'package:flex/data/model/catefgory.dart';
import 'package:flex/data/model/slide.dart';


class Home { 
  List<Slide> sliders =[];
  List<Category> categories = [];
  List<Product> amazingProduct =[];
  List<Product> newestProduct =[];
  List<Product> modeSellerProducts =[];
  final Banner banner ;

  Home({
    required this.amazingProduct,
    required this.banner,
    required this.categories,
    required this.newestProduct,
    required this.sliders,
    required this.modeSellerProducts
  });

  factory Home.fromJson(Map<String , dynamic> json){
    return Home(
      modeSellerProducts: (json["most_seller_products"]as List<dynamic>).map((e) => Product.fromJson(e)).toList(),
      amazingProduct:(json["sliders"]as List<dynamic>).map((e) => Product.fromJson(e)).toList() ,
      banner: Banner.fromJson(json["banner"]),
      categories: (json["categories"]as List<dynamic>).map((e) => Category.fromJson(e)).toList(),
      newestProduct: (json["newest_products"] as List<dynamic>).map((e) => Product.fromJson(e)).toList(),
      sliders:(json["sliders"] as List<dynamic>).map((e) => Slide.fromJson(e)).toList()
      ) ;
  }
} 