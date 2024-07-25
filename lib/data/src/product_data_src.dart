


import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flex/data/model/product.dart';
import 'package:flex/utils/response_validators.dart';

abstract class IProductDataSrc {
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParametr);
  Future<List<Product>> searchProduct(String searcKey);
}


class ProductRemoteDataSource implements IProductDataSrc{
    ProductRemoteDataSource({required this.httpClient});
    final Dio httpClient;

  @override
  Future<List<Product>> getAllByBrand(int id)async{
  List<Product> products = [];
  final response = await httpClient.get(EndPoint.productsByBrand+id.toString());
  HttpResponseValidators.isValidStatusCode(response.statusCode!); 

  for(var element in response.data["all_products"]["data"] as List ){
    products.add(Product.fromJson(element));
  }  
    return products;
  }

  @override
  Future<List<Product>> getAllByCategory(int id)async {
  List<Product> products = [];
  final response = await httpClient.get(EndPoint.productsByCategory+id.toString());
  HttpResponseValidators.isValidStatusCode(response.statusCode! ?? 0); 

  for(var element in response.data["all_products"]["data"] as List ){
    products.add(Product.fromJson(element));
  }  
    return products;

  }

  @override
  Future<List<Product>> getSorted(String routeParametr)async {
  List<Product> products = [];
  final response = await httpClient.get(EndPoint.productsByBrand+routeParametr);
  HttpResponseValidators.isValidStatusCode(response.statusCode! ?? 0); 

  for(var element in response.data["all_products"]["data"] as List ){
    products.add(Product.fromJson(element));
  }  
    return products;
  }

  @override
  Future<List<Product>> searchProduct(String searcKey)async {
  List<Product> products = [];
  final response = await httpClient.get(EndPoint.productsByBrand+searcKey);
  HttpResponseValidators.isValidStatusCode(response.statusCode! ?? 0); 

  for(var element in response.data["all_products"]["data"] as List ){
    products.add(Product.fromJson(element));
  }  
    return products;
  }

}