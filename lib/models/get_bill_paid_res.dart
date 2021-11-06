import 'dart:convert';

BillPaid billPaidFromJson(String str) => BillPaid.fromJson(json.decode(str));

String billPaidToJson(BillPaid data) => json.encode(data.toJson());

class BillPaid {
  BillPaid({
    this.result,
    this.status,
  });

  List<Result>? result;
  int? status;

  factory BillPaid.fromJson(Map<String, dynamic> json) => BillPaid(
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
    this.electricityBill,
    this.service,
    this.time,
    this.total,
    this.waterBill,
  });

  String? electricityBill;
  String? service;
  String? time;
  String? total;
  String? waterBill;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    electricityBill: json["electricity_bill"],
    service: json["service"],
    time: json["time"],
    total: json["total"],
    waterBill: json["water_bill"],
  );

  Map<String, dynamic> toJson() => {
    "electricity_bill": electricityBill,
    "service": service,
    "time": time,
    "total": total,
    "water_bill": waterBill,
  };
}
