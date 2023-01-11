import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_rest_api_flutter/block/user/user_block.dart';
import 'package:test_rest_api_flutter/block/user/user_event.dart';
import 'package:test_rest_api_flutter/block/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';
import 'package:test_rest_api_flutter/views/user/profile.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
            return UserView(state.userList);
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

  Widget UserView(List<UserData> userList) {
    return Expanded(
      child: ListView(
        children: userList
            .map((user) => InkWell(
                  onTap: () {
                    Get.to(const Profile(), arguments: userList);
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
                ))
            .toList(),
      ),
    );
  }
}
