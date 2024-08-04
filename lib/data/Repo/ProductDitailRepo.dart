import 'package:dio/dio.dart';
import 'package:flex/data/model/product.dart';
import 'package:flex/data/model/product_dirtail.dart';
import 'package:flex/data/src/ProductDitailDataSrc.dart';



abstract class IProductReop {
  Future<ProductDetail> getProductDetailes(int id);
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRepository implements IProductReop {
  final IProductDataSrc _iProductDataSrc;

  ProductRepository(this._iProductDataSrc);

  @override
  Future<List<Product>> getAllByBrand(int id) =>
      _iProductDataSrc.getAllByBrand(id);

  @override
  Future<List<Product>> getAllByCategory(int id) =>
      _iProductDataSrc.getAllByCategory(id);

  @override
  Future<List<Product>> getSorted(String routeParam) =>
      _iProductDataSrc.getSorted(routeParam);
  @override
  Future<List<Product>> searchProducts(String searchKey) =>
      _iProductDataSrc.searchProducts(searchKey);

  @override
  Future<ProductDetail> getProductDetailes(int id) =>
      _iProductDataSrc.getProductDetailes(id);
}

final productRepository = ProductRepository(ProductRemoteDataSrc(Dio()));