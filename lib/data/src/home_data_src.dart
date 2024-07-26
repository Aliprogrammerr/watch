import 'package:dio/dio.dart';
import 'package:flex/constant/constant.dart';
import 'package:flex/data/model/home.dart';
import 'package:flex/utils/response_validators.dart';


abstract class IHomeDataSrc {
  Future<Home> getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc {
  final Dio httpClient;

  HomeRemoteDataSrc(this.httpClient);

  @override
  Future<Home> getHome() async {
    final Home _home;

    final response = await httpClient.get(EndPoint.home);
    HttpResponseValidators.isValidStatusCode(response.statusCode ?? 0);
    _home = Home.fromJson(response.data['data']);
    return _home;
  }
}