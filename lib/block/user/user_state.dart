import 'package:flutter/cupertino.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserData> userList;
  UserLoadedState({required this.userList});
}

class UserErrorState extends UserState {}