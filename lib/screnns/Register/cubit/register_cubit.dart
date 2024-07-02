import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flex/utils/SharedPrefernce_manager.dart';
import 'package:flex/utils/shared_prefernses_const.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
   

   Dio dio = Dio();
  RegisterCubit() : super(RegisterInitial()) {
    emit(LogOut());
  }


  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await dio.post(EndPoint.sendSms, data: {"mobile": mobile}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          emit(SentState(mobile: mobile));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
    

  varifyCode(String mobile, String code) {
    emit(LoadingState());
    try {
      dio.post(EndPoint.checkSmsCode, data: {"mobile": mobile,"code":code}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          SharedPerfencesManager().saveString(SharedPreferencesConsts.token,value.data["data"]["token"]);
          if (value.data["data"]["is_registered"]){
            emit(VerifiedIsRegistered());
          } else {
             emit(VerifiedNotRegistered());
          } 
        } 
        else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
