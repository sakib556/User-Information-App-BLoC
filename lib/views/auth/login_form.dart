import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_rest_api_flutter/block/login/login.dart';
import 'package:test_rest_api_flutter/repository/user_repository.dart';
import 'package:test_rest_api_flutter/views/style/app_colors.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  const LoginForm({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10.0),
            // color: Colors.yellow,
            child: Form(
              child: SingleChildScrollView(
                
                child: Column(
                  children: [
                    loginTitle(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    emailTextField(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    passwordTextField(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: forgotPasswordBtn(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                              height: 45,
                              child: state is LoginLoading
                                  ? activityIndicator()
                                  : loginBtn(_onLoginButtonPressed)
                                  ),
                        ],
                      ),
                    ),
                    orConnectTitle(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        fbLoginBtn(() {}),
                        googleLoginBtn(),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    registerBtn(() {}),
                    const SizedBox(
                      height: 20.0,
                    )
                  
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget loginTitle() {
    return Container(
        height: 200.0,
        padding: const EdgeInsets.only(bottom: 20.0, top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Log In Now",
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Login app using BLOC pattern and REST API",
              style: TextStyle(fontSize: 10.0, color: Colors.black38),
            )
          ],
        ));
  }

  Widget emailTextField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.titleColor,
          fontWeight: FontWeight.bold),
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.black26),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "E-Mail",
        hintStyle: const TextStyle(
            fontSize: 12.0, color: AppColors.grey, fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.titleColor,
          fontWeight: FontWeight.bold),
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.black26,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Password",
        hintStyle: const TextStyle(
            fontSize: 12.0, color: AppColors.grey, fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
      obscureText: true,
    );
  }

  Widget forgotPasswordBtn() {
    return InkWell(
        child: const Text(
          "Forget password?",
          style: TextStyle(color: Colors.black45, fontSize: 12.0),
        ),
        onTap: () {});
  }

  Widget activityIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CupertinoActivityIndicator(),
            )
          ],
        ))
      ],
    );
  }

  Widget loginBtn(void Function()? onLoginButtonPressed) {
    return SizedBox(
      width: 60,
      child: ElevatedButton(
          onPressed: onLoginButtonPressed,
          child: const Text("LOG IN",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }

  Widget registerBtn(void Function()? onButtonPressed) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don't have an account?",
                style: TextStyle(color: AppColors.grey),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5.0),
              ),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )),
    );
  }

  Widget fbLoginBtn(void Function()? onButtonPressed) {
    return SizedBox(
      height: 40.0,
      width: 120.0,
      child: ElevatedButton(
          onPressed: onButtonPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.facebook,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text("Facebook",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          )),
    );
  }

  Widget googleLoginBtn() {
    return SizedBox(
      width: 120.0,
      height: 40.0,
      child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.route_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text("Google",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          )),
    );
  }

  Widget orConnectTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Or connect using",
          style: TextStyle(color: Colors.black26, fontSize: 12.0),
        ),
      ],
    );
  }
}
