import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/api/user_api.dart';
import 'package:test_rest_api_flutter/block/user/user_block.dart';
import 'package:test_rest_api_flutter/views/home.dart';

void main() => runApp(BlocProvider<UserBloc>(
      create: (context) => UserBloc(UserApi()),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData.light(),
        home: const HomeScreen());
  }
}
