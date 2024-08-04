part of 'productditail_bloc.dart';

@immutable
abstract class ProductditailState {}

class ProductditailLoading extends ProductditailState {}

class ProductditailLoaded extends ProductditailState {
  final ProductDetail productDetail;
  ProductditailLoaded({required this.productDetail}); 
}

class ProductditailError extends ProductditailState { }
