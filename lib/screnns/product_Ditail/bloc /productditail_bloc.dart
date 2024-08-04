import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flex/data/model/product_dirtail.dart';
import 'package:flex/data/Repo/ProductDitailRepo.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:meta/meta.dart';

part 'productditail_event.dart';
part 'productditail_state.dart';

class ProductditailBloc extends Bloc<ProductditailEvent, ProductditailState> {
    final IProductReop _iProductReop ; 

  ProductditailBloc(this._iProductReop)  : super(ProductditailLoading()){
    on<ProductditailInit>((event, emit) async {
      if (event is ProductditailInit) {
        try {
          emit(ProductditailLoading());
          final productDetail = await _iProductReop.getProductDetailes(event.id);
          emit(ProductditailLoaded(productDetail: productDetail));
        } catch (e) {
          emit(ProductditailError());
        }
      }
    });

  }

  
}
