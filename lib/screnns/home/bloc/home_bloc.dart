import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flex/data/Repo/Home_repo.dart';
import 'package:flex/data/model/home.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepo homeRepo;
  HomeBloc(this.homeRepo) : super(HomeLoading()){
    on<HomeEvent>((event,emit) async{
      if(event is HomeInit){
        try {
          emit(HomeLoading());
          final home = await homeRepo.gethome();
          emit(HomeLoeaded(home: home));
        }catch(e){
          emit(HomeError());
        }
      }
    });

  }

}
