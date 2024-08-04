part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoeaded extends HomeState{
  HomeLoeaded({required this.home});
  final Home home;
}

class HomeError extends HomeState{} 