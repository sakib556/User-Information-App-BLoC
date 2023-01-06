// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/block/user/user_block.dart';
import 'package:test_rest_api_flutter/block/user/user_event.dart';
import 'package:test_rest_api_flutter/block/user/user_state.dart';
import 'package:test_rest_api_flutter/controllers/user_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';
import 'package:test_rest_api_flutter/views/user/profile.dart';

// ignore: must_be_immutable
class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

  UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserInitialState) {
            context.read<UserBloc>().add(LoadUserEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoadedState) {
            return UserView();
          } else if (state is UserErrorState) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          return const Center(
            child: Text('Unexpected Error'),
          );
        }),
      ),
    );
  }

  Widget UserView() {
    return Obx(() => Center(
        child: ListView.builder(
            itemCount: controller.userList.length,
            itemBuilder: (context, int index) {
              final user = controller.userList[index] as Data;
              return InkWell(
                onTap: () {
                  Get.to(const Profile(), arguments: user);
                },
                child: ListTile(
                  trailing: CircleAvatar(
                    radius: 50,
                    child: Image.network(user.avatar),
                  ),
                  title: Text(user.firstName),
                  subtitle: Text(
                    user.lastName,
                  ),
                ),
              );
            })));
  }
}
