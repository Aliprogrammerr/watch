import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial()) {
    emit(LogOut());
  }

  final Dio _dio = Dio();
  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio
          .post(EndPoint.sendSms, data: {"mobile": mobile}).then((value) {
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
    
Dio dio = Dio();
  varifyCode(String mobile, String code) {
    try {
      dio.post(EndPoint.checkSmsCode, data: {"mobile": mobile, "code": code}).then(
          (value) {
        debugPrint(value.toString());

        if (value.statusCode == 201) {
          if (value.data["data"]["is_registered"]) {
            emit(VerifiedIsRegistered());
          } else {
            VerifiedNotRegisstered();
          } 
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
