import 'package:demo_manager/models/bill_res.dart';
import 'package:demo_manager/models/get_user_res.dart';
import 'package:demo_manager/models/login_res.dart';
import 'package:demo_manager/models/register_resident.dart';
import 'package:demo_manager/models/ship_register_res.dart';
import 'package:demo_manager/models/signup_res.dart';
import 'package:dio/dio.dart';

import 'dio_client.dart';

class Api {
  RestClient restClient = RestClient(Dio());

  Future<LoginResponse?> login(String email, String password) async {
    Response response;
    try {
      response = await restClient.post('auths/login',
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      }
      else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  Future<SignupResponse?> Signup(String name, String email,
      String password) async {
    Response response;
    try {
      response = await restClient.post('auths/register',
          data: {'name': name, 'email': email, 'password': password});
      if (response.statusCode == 200) {
        return SignupResponse.fromJson(response.data);
      }
      else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
  Future<RegisterResidentResponse?> RegisterResident({required String token, required String name}) async {
    Response response;
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    try {
      response = await dio.post('http://192.168.0.176:5000/api/v1/auths/resident/register',
          data: {'name': name});
      if (response.statusCode == 200) {
        return RegisterResidentResponse.fromJson(response.data);
      }
      else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }


  Future<GetUserResponse?> getUser(String token) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response;
    try {
      response = await dio.get('http://192.168.0.176:5000/api/v1/auths/verify',);
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

  Future<BillResponse?> getPaidBill(String token) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response;
    try {
      response =
      await dio.get('http://192.168.0.176:5000/api/v1//auths/bill',);
      if (response.statusCode == 200) {
        return BillResponse.fromJson(response.data);
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  Future<ShipRegisterResponse?> shipRegister( String orderName, String value, String time, bool isChecked, String deliveryTime, {required String token} ) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response;
    try {
      print(123);
      response = await dio.post('http://192.168.0.176:5000/api/v1/auths/ship/register',
          data: {'orderName': orderName, 'value': value, 'time': time,'isChecked':isChecked,'deliveryTime':deliveryTime });
      if (response.statusCode == 200) {
        return ShipRegisterResponse.fromJson(response.data);
      }
      else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }


}