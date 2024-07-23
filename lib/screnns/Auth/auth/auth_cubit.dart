import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flex/data/model/user.dart';
import 'package:flex/utils/SharedPrefernce_manager.dart';
import 'package:flex/utils/shared_prefernses_const.dart';

import 'package:get/get.dart' as prefix;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  final Dio _dio = Dio();
  



  // pickTheLocation({required context})async {
  //   await showSimplePickerLocation(
  //     title: "pick your loxcation",
  //     isDismissible: true,
  //     textCancelPicker: "cancel",
  //     textConfirmPicker: "ok",
  //     zoomOption: const ZoomOption(initZoom: 8),
  //     initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  //     radius: 8,
  //     context:context).then((value){
  //       emit(LocationPickState(location: value!));
  //     });
  // }
  // register({required User user}) async{
  //   emit(LoadingState()); 
  //   try{
  //     String? token = SharedPerfencesManager().getString(SharedPreferencesConsts.token);

  //     _dio.options.headers["Authorization"] = "Bearer $token";
  //     await _dio.post(EndPoint.register,data: FormData.fromMap(user.toMap())).then((value){
  //       if (value.statusCode ==201){
  //         emit(OkResponseState());
  //       }else {
  //         emit(ErrorState());
  //       }
  //     });
  //   }
  //   catch(e){
  //     emit(ErrorState());

  //   }
  // }



}


