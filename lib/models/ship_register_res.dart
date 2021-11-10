// To parse this JSON data, do
//
//     final shipRegisterResponse = shipRegisterResponseFromJson(jsonString);

import 'dart:convert';

ShipRegisterResponse shipRegisterResponseFromJson(String str) => ShipRegisterResponse.fromJson(json.decode(str));

String shipRegisterResponseToJson(ShipRegisterResponse data) => json.encode(data.toJson());

class ShipRegisterResponse {
  ShipRegisterResponse({
    this.result,
    this.status,
    this.message,
  });

  Result? result;
  int? status;
  String? message="";

  factory ShipRegisterResponse.fromJson(Map<String, dynamic> json) => ShipRegisterResponse(
    result: Result.fromJson(json["result"]),
    status: json["status"],
      message: json["message"]
  );

  Map<String, dynamic> toJson() => {
    "result": result!.toJson(),
    "status": status,
    "message": message

  };
}

class Result {
  Result({
    this.deliveryTime,
    this.isChecked,
    this.orderName,
    this.time,
    this.value,
  });

  String? deliveryTime;
  bool? isChecked;
  String? orderName;
  String? time;
  String? value;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    deliveryTime: json["delivery_time"],
    isChecked: json["is_checked"],
    orderName: json["order_name"],
    time: json["time"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "delivery_time": deliveryTime,
    "is_checked": isChecked,
    "order_name": orderName,
    "time": time,
    "value": value,
  };
}
