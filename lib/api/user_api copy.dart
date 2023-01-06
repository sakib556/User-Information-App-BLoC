import 'package:dio/dio.dart';
import 'package:test_rest_api_flutter/models/user_model.dart';

class UserApi2 {
  UserApi2._internal();

  static final UserApi2 _instance = UserApi2._internal();
  static UserApi2 get instance => _instance;

  final _dio = Dio();

  Future<List<UserModel>> getUser(int page) async {
    Response response = await _dio
        .get("https://reqres.in/api/users", queryParameters: {"page": page});
    
    //we can also use headers with options parameter
    //Response response = await _dio
    // .get( "https://reqres.in/api/users",
    //        options: Options(headers: {}) , 
    //        queryParameters: {"page": page}); 

    return (response.data["data"] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
