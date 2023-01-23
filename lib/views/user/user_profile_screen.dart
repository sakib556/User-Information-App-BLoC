import 'package:flutter/material.dart';
import 'package:test_rest_api_flutter/models/singleton.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = getIt<UserData>();
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
                  backgroundImage: NetworkImage(userData.avatar),
                ),
                const SizedBox(height: 10),
                Text("${userData.firstName} ${userData.lastName}")
              ],
            ),
          ),
        ));
  }
}
