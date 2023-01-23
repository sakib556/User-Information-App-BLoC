import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_rest_api_flutter/models/singleton.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserRepository {
  static String mainUrl = "https://reqres.in";
  static var loginUrl = '$mainUrl/api/login';
  static var allUserUrl = '$mainUrl/api/users?page=2';
  static var singleUserUrl = '$mainUrl/api/users';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  static final Dio _dio = Dio();

  static Future<UserModel?> getAllUser() async {
    Response response = await _dio.get(allUserUrl);
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      print("The response is that \n${response.data}\n");
      // no need to decode , when we use dio package , its response returns the String,dynamic
      getIt.registerSingleton<UserModel>(UserModel.fromMap(response.data));
      return UserModel.fromMap(response.data);
    }
  }

  static Future<List<UserData>> getUser(int page) async {
    final dio = Dio();
    Response response =
        await dio.get(singleUserUrl, queryParameters: {"page": page});
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      print(response.data);
      return List<UserData>.from(response.data.map((x) => x));
    }
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String phone, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": phone,
      "password": password,
    });
    return response.data["token"];
  }
}
