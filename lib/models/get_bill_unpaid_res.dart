// To parse this JSON data, do
//
//     final billUnpaid = billUnpaidFromJson(jsonString);

import 'dart:convert';

BillUnpaid billUnpaidFromJson(String str) => BillUnpaid.fromJson(json.decode(str));

String billUnpaidToJson(BillUnpaid data) => json.encode(data.toJson());

class BillUnpaid {
  BillUnpaid({
    this.result,
    this.status,
  });

  List<Result>? result;
  int? status;

  factory BillUnpaid.fromJson(Map<String, dynamic> json) => BillUnpaid(
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
    this.content,
    this.time,
    this.total,
  });

  String? content;
  String? time;
  String? total;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    content: json["content"],
    time: json["time"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "time": time,
    "total": total,
  };
}
