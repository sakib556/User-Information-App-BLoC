import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = Get.arguments as UserModel;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Page"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar!),
                ),
                const SizedBox(height: 10),
                Text("${user.firstName!} ${user.lastName!}")
              ],
            ),
          ),
        ));
  }
}