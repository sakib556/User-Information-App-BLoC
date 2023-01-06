import 'package:dio/dio.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserApi {
  static Future<UserModel?> getUser(int page) async {
    final _dio = Dio();
    Response response = await _dio
        .get("https://reqres.in/api/users", queryParameters: {"page": page});
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      print(response.data);
      return UserModel.fromJson(response.data);
    }
  }
}
