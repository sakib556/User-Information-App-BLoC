import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_rest_api_flutter/block/auth/auth.dart';
import 'package:test_rest_api_flutter/block/login/login.dart';
import 'package:test_rest_api_flutter/repository/user_repository.dart';
import 'package:test_rest_api_flutter/views/auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  const LoginScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
