import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/repository/user_repository.dart';
import 'package:test_rest_api_flutter/block/user/user_event.dart';
import 'package:test_rest_api_flutter/block/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repo = Get.put(UserRepository());
  var api = [].obs;
  UserBloc(this.repo) : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadUserEvent) {
        emit(UserLoadingState());
        var apiValue = (await UserRepository.getAllUser())?.userData;
        if (apiValue == null) {
          emit(UserErrorState());
        } else {
          emit(UserLoadedState(api: api));
        }
      }
    });
  }
}
