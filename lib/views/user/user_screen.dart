import 'package:flutter/material.dart';
import 'package:test_rest_api_flutter/block/user/user_block.dart';
import 'package:test_rest_api_flutter/block/user/user_event.dart';
import 'package:test_rest_api_flutter/block/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_rest_api_flutter/models/singleton.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';
import 'package:test_rest_api_flutter/services/app_router.dart';
import 'package:test_rest_api_flutter/views/user/user_form_screen.dart';
import 'package:test_rest_api_flutter/views/user/user_profile_screen.dart';

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
            return userView(state.userList, context);
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

  Widget userView(List<UserData> userList, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(onPressed: () {
            AppRouter.route(context, const UserFormScreen());
          }, child: const Text("Add new user")),
          Expanded(
            child: ListView(
              children: userList
                  .map((user) => InkWell(
                        onTap: () {
                          getIt.registerFactory<UserData>(() => user);
                          AppRouter.route(context, const UserProfileScreen());
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
          ),
        ],
      ),
    );
  }
}
