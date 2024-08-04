part of 'productditail_bloc.dart';

@immutable
abstract class ProductditailEvent {}

class ProductditailInit extends ProductditailEvent{
  final id; 
  ProductditailInit({required this.id});
}
