import 'package:dio/dio.dart';
import 'package:flex/data/model/home.dart';
import 'package:flex/data/src/ghome_data_src.dart';
import 'package:flutter/physics.dart';

 


 abstract class IHomeRepo {
  Future<Home> getHome();
 }


class HomeRepositry implements IHomeRepo {
  HomeRepositry({required this.iHomeDataSrc});
  final IHomeDataSrc iHomeDataSrc;
  @override
  Future<Home> getHome()=> iHomeDataSrc.getHome(); 

}

final homeRepository = HomeRepositry(iHomeDataSrc:HomeRemoteDataSrc(httpClient:Dio()));