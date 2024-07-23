 

import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flex/data/model/home.dart';
import 'package:flex/utils/response_validators.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

abstract class IHomeDataSrc {
  Future<Home> getHome();

 }


 class HomeRemoteDataSrc implements IHomeDataSrc{
  HomeRemoteDataSrc({required this.httpClient});
  final Dio httpClient ;
  
  @override
  Future<Home> getHome() async{
    final Home home;
    final response = await httpClient.get(EndPoint.home);
    HttpResponseValidators.isValidStatusCode(response.statusCode! ?? 0);
    home = Home.fromJson(response.data["data"]);
    return home;
  }

 }