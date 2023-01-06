import 'package:dio/dio.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserApi {
  static Future<UserModel?> getAllUser() async {
    final dio = Dio(); 
    Response response = await dio.get("https://reqres.in/api/users?page=2");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      print("The response is that \n${response.data}\n"); 
       // no need to decode , when we use dio package , its response returns the String,dynamic
       return UserModel.fromMap(response.data); 
    }
  }

  static Future<List<Data>> getUser(int page) async {
    final dio = Dio();
    Response response = await dio
        .get("https://reqres.in/api/users", queryParameters: {"page": page});
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      print(response.data);
      return List<Data>.from(response.data.map((x) => x));
    }
  }
}
