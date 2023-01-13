import 'package:bloc/bloc.dart';
import 'package:test_rest_api_flutter/block/auth/auth.dart';
import 'package:test_rest_api_flutter/repository/user_repository.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.authenticationBloc, required this.userRepository})
      : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        authenticationBloc.add(LoggedIn(token: token));
        emit(LoginInitial());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
