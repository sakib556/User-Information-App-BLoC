import 'package:get/get.dart';
import 'package:test_rest_api_flutter/api/user_api.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = [].obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    try {
      isLoading(true);
      var users = (await UserApi.getAllUser())?.userData;
      if (users != null) {
        Rx(userList.value = users);
      }
    } finally {
      isLoading(false);
    }
  }


  // List<UserModel> _users = [];
  // bool? _loading = true;
  // List<UserModel> get users => _users;
  // bool? get loading => _loading;



  // Future<void> loadUsers() async {
  //   _loading = true;
  //   final data = await UserApi.getUser(1);
  //   _users = data;
  //   _loading = false;
  //   update(["users"]);
  // }

  // @override
  // void onInit() {
  //   loadUsers();
  //   super.onInit();
  //   super.onReady();
  // }
}