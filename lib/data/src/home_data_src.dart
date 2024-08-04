import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';

import 'package:flex/data/model/home.dart';
import 'package:flex/utils/response_validators.dart';

abstract class IHomeDataSrc {
  Future<Home> getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc {


  HomeRemoteDataSrc();

  @override
  Future<Home> getHome() async {
    final Home home;

    final response = await Dio().get(EndPoint.home);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    home = Home.fromJson(response.data['data']);
    return home;
  }
}