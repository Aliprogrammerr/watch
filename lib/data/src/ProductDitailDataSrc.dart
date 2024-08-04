import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flex/data/model/product.dart';
import 'package:flex/data/model/product_dirtail.dart';
import 'package:flex/utils/response_validators.dart';
import 'package:flutter/material.dart';


abstract class IProductDataSrc {
  Future<ProductDetail> getProductDetailes(int id);
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRemoteDataSrc implements IProductDataSrc {
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);

  @override
  Future<List<Product>> getAllByBrand(int id) async {
    List<Product> products = <Product>[];

    final response =
        await httpClient.get(EndPoint.productsByBrand + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<Product>> getAllByCategory(int id) async {
    List<Product> products = <Product>[];

    final response =
        await httpClient.get(EndPoint.productsByCategory + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var elemnt
        in (response.data['products_by_category']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<Product>> getSorted(String routeParam) async {
    List<Product> products = <Product>[];

    final response = await httpClient.get(EndPoint.baseurl + routeParam);
    debugPrint(response.statusCode.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    debugPrint(response.data.toString());
    for (var elemnt in response.data['all_products']['data'] as List) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProducts(String searchKey) async {
    List<Product> products = <Product>[];

    final response = await httpClient.get(EndPoint.baseurl + searchKey);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }

  @override
  Future<ProductDetail> getProductDetailes(int id) async {
    final response =
        await httpClient.get(EndPoint.productDitail + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return ProductDetail.fromJson(response.data['data'][0]);
  }
}