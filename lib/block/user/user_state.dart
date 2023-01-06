import 'package:flutter/cupertino.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final api;
  UserLoadedState({required this.api});
}

class UserErrorState extends UserState {}