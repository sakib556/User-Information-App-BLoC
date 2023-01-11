import 'package:flutter/material.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key, required this.user}) : super(key: key);
  final UserData user;
  static const id = "user_profile_screen";
  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: NetworkImage(user.avatar),
                ),
                const SizedBox(height: 10),
                Text("${user.firstName} ${user.lastName}")
              ],
            ),
          ),
        ));
  }
}
