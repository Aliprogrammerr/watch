import 'package:flex/data/model/product.dart';
import 'package:flex/data/src/product_data_src.dart';

abstract class IProductRepo {
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParametr);
  Future<List<Product>> searchProduct(String searcKey);
}

class ProductRepository implements IProductRepo{
  final IProductDataSrc iProductDataSrc ;
  ProductRepository({required this.iProductDataSrc});
  

  @override
  Future<List<Product>> getAllByBrand(int id) => iProductDataSrc.getAllByBrand(id);

  @override
  Future<List<Product>> getAllByCategory(int id) => iProductDataSrc.getAllByCategory(id);

  @override
  Future<List<Product>> getSorted(String routeParametr) => iProductDataSrc.getSorted(routeParametr);

  @override
  Future<List<Product>> searchProduct(String searcKey) => iProductDataSrc.searchProduct(searcKey); 
  
}