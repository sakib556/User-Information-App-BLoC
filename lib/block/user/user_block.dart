import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/block/user/user_event.dart';
import 'package:test_rest_api_flutter/block/user/user_state.dart';

class DataBloc extends Bloc<UserEvent, UserState> {
  Repo repo = Get.put(Repo());
  var api = [].obs;
  DataBloc(this.repo) : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadUserEvent) {
        emit(UserLoadingState());
        var apiValue = (await Repo.getData())?.data!.products.results;
        if (apiValue == null) {
          emit(UserErrorState());
        } else {
          emit(UserLoadedState(api: api));
        }
      }
    });
  }
}