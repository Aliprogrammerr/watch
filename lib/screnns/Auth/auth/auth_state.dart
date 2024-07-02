part of 'auth_cubit.dart';


abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState{}

class ErrorState extends AuthState{}

class OkResponseState extends AuthState{}

// class LocationPickState extends AuthState{
//   final GeoPoint location;
// //   LocationPickState({required this.location}); 

// } 
