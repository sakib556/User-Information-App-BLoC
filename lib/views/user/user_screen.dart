import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/controllers/user_controller.dart';
import 'package:test_rest_api_flutter/views/user/profile.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (userController) {
        return Scaffold(
          body: Center(
            child: GetBuilder<UserController>(
                id: 'users',
                builder: (data) {
                  if (data.loading!) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.builder(
                      itemCount: data.users.length,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to(const Profile(), arguments: data.users[index]);
                          },
                          child: ListTile(
                            trailing: CircleAvatar(
                              radius: 50,
                              child: Image.network(data.users[index].avatar!),
                            ),
                            title: Text(data.users[index].firstName!),
                            subtitle: Text(
                              data.users[index].lastName!,
                            ),
                          ),
                        );
                      });
                }),
          ),
        );
      },
    );
  }
}