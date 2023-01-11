import 'package:flutter/material.dart';
import 'package:test_rest_api_flutter/services/app_router.dart';
import 'package:test_rest_api_flutter/views/user/user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AppRouter.route(context, const UserScreen());
                },
                child: const Text("Users"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Others"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
