

import 'package:dio/dio.dart';
import 'package:flex/data/model/home.dart';
import 'package:flex/data/src/home_data_src.dart';

abstract class IHomeRepo {
  Future<Home> gethome(); 
}


class HomeRepository extends IHomeRepo {
  HomeRepository({required this.iHomeDataSrc});
  final IHomeDataSrc iHomeDataSrc;
  
  @override 
  Future<Home> gethome() => iHomeDataSrc.getHome();  

}

final homeRepository =  HomeRepository(iHomeDataSrc: HomeRemoteDataSrc());