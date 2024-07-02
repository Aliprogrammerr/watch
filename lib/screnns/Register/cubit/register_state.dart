// ignore_for_file: prefer_typing_uninitialized_variables

part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class LoadingState extends RegisterState{}
class VerifiedIsRegistered extends RegisterState{}
class VerifiedNotRegistered  extends RegisterState{}
class ErrorState extends RegisterState{}
class SentState  extends RegisterState{
  final mobile ; 
  SentState({required this.mobile});
}

class LogIn extends RegisterState{}
class LogOut extends RegisterState{}



