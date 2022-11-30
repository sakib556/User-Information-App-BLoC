import 'package:get/get.dart';
import 'package:test_rest_api_flutter/api/user_api.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserController extends GetxController {
  List<UserModel> _users = [];
  bool? _loading = true;
  List<UserModel> get users => _users;
  bool? get loading => _loading;



  Future<void> loadUsers() async {
    _loading = true;
    final data = await UserApi.instance.getUser(1);
    _users = data;
    _loading = false;
    update(["users"]);
  }

  @override
  void onInit() {
    super.onInit();
    super.onReady();
    loadUsers();
  }
}