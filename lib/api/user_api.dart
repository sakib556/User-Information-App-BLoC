import 'package:dio/dio.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserApi {
  UserApi._internal();

  static final UserApi _instance = UserApi._internal();
  static UserApi get instance => _instance;

  final _dio = Dio();

  Future<List<UserModel>> getUser(int page) async {
    Response response = await _dio
        .get("https://reqres.in/api/users", queryParameters: {"page": page});
    
    //Response response = await _dio
    //  .get( "https://reqres.in/api/users",options: Options(headers: {}) , queryParameters: {"page": page}); 

    return (response.data["data"] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
