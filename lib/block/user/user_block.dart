import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/api/user_api.dart';
import 'package:test_rest_api_flutter/block/user/user_event.dart';
import 'package:test_rest_api_flutter/block/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserApi repo = Get.put(UserApi());
  var api = [].obs;
  UserBloc(this.repo) : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadUserEvent) {
        emit(UserLoadingState());
        var apiValue = (await UserApi.getAllUser())?.userData;
        if (apiValue == null) {
          emit(UserErrorState());
        } else {
          emit(UserLoadedState(api: api));
        }
      }
    });
  }
}
