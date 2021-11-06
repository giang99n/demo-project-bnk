import 'package:demo_manager/models/get_bill_paid_res.dart';
import 'package:demo_manager/models/get_bill_unpaid_res.dart';
import 'package:demo_manager/models/get_user_res.dart';
import 'package:demo_manager/models/login_res.dart';
import 'package:dio/dio.dart';

import 'dio_client.dart';

class Api{
  RestClient restClient = RestClient(Dio());
  Future<LoginResponse?> login( String email, String password) async{
    Response response;
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
    try {
      response = await dio.get('http://192.168.1.44:5000/api/v1/auths/verify',);
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

  Future<BillPaid?> getPaidBill( String token) async{
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response;
    try {
      response = await dio.get('http://192.168.1.44:5000/api/v1//auths/bill/paid',);
      if (response.statusCode == 200) {
        return BillPaid.fromJson(response.data);
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  Future<BillUnpaid?> getUnpaidBill( String token) async{
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response;
    try {
      response = await dio.get('http://192.168.1.44:5000/api/v1//auths/bill/unpaid',);
      if (response.statusCode == 200) {
        return BillUnpaid.fromJson(response.data);
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }


}