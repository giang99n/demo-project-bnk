
import 'dart:convert';

ShipListOrderResponse shipListOrderResponseFromJson(String str) => ShipListOrderResponse.fromJson(json.decode(str));

String shipListOrderResponseToJson(ShipListOrderResponse data) => json.encode(data.toJson());

class ShipListOrderResponse {
  ShipListOrderResponse({
    this.result,
    this.status,
  });

  List<Result>? result;
  int? status;

  factory ShipListOrderResponse.fromJson(Map<String, dynamic> json) => ShipListOrderResponse(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "status": status,
  };
}

class Result {
  Result({
    this.orderName,
    this.state,
    this.value,
  });

  String? orderName;
  String? state;
  String? value;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    orderName: json["order_name"],
    state: json["state"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "order_name": orderName,
    "state": state,
    "value": value,
  };
}
