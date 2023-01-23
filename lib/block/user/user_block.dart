import 'package:bloc/bloc.dart';
import 'package:test_rest_api_flutter/models/singleton.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';
import 'package:test_rest_api_flutter/repository/user_repository.dart';
import 'package:test_rest_api_flutter/block/user/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserRepository userRepository) : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadUserEvent) {
        emit(UserLoadingState());
        var apiValue = (
          await UserRepository.getAllUser())?.userData;
          
        if (apiValue == null) {
          emit(UserErrorState());
        } else {
          emit(UserLoadedState(userList: apiValue));
        }
      }
    });
  }
}
