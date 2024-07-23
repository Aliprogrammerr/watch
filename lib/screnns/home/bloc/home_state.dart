part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}


class HomeLoading extends HomeState{}

class HomeError extends HomeState{}

class HomeLoaded extends HomeState{
  HomeLoaded({required this.home});
  final Home home;
}