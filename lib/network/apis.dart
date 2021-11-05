import 'package:demo_manager/models/get_user_res.dart';
import 'package:demo_manager/models/login_res.dart';
import 'package:dio/dio.dart';

import 'dio_client.dart';

class Api{
  RestClient restClient = RestClient(Dio());
  Future<LoginResponse?> login( String email, String password) async{
    Response response;
// 'email': 'a1l22@gmail.com','password': 'alo123',
    try {
      response = await restClient.post('auths/login',
          data: {'email': email, 'password':password});
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }



  Future<GetUserResponse?> getUser( String token) async{
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response;
// 'email': 'a1l22@gmail.com','password': 'alo123',
    try {
      response = await dio.get('http://192.168.0.46:5000/api/v1/auths/verify',);
      if (response.statusCode == 200) {
        return GetUserResponse.fromJson(response.data);
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }


}