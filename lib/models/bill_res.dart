import 'dart:convert';

BillResponse billResponseFromJson(String str) =>
    BillResponse.fromJson(json.decode(str));

String billResponseToJson(BillResponse data) => json.encode(data.toJson());

class BillResponse {
  BillResponse({
    this.result,
    this.status,
  });

  List<Result>? result;
  int? status;

  factory BillResponse.fromJson(Map<String, dynamic> json) => BillResponse(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "status": status,
      };
}

class Result {
  Result({
    this.electricityBill,
    this.isPaid,
    this.service,
    this.time,
    this.total,
    this.waterBill,
  });

  String? electricityBill;
  bool? isPaid;
  String? service;
  String? time;
  String? total;
  String? waterBill;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        electricityBill: json["electricity_bill"],
        isPaid: json["is_paid"],
        service: json["service"],
        time: json["time"],
        total: json["total"],
        waterBill: json["water_bill"],
      );

  Map<String, dynamic> toJson() => {
        "electricity_bill": electricityBill,
        "is_paid": isPaid,
        "service": service,
        "time": time,
        "total": total,
        "water_bill": waterBill,
      };
}
