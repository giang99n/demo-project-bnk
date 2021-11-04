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

}