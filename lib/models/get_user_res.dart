import 'dart:convert';

GetUserResponse getUserResponseFromJson(String str) =>
    GetUserResponse.fromJson(json.decode(str));

String getUserResponseToJson(GetUserResponse data) =>
    json.encode(data.toJson());

class GetUserResponse {
  GetUserResponse({
    this.result,
    this.status,
  });

  Result? result;
  int? status;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      GetUserResponse(
        result: Result.fromJson(json["result"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "status": status,
      };
}

class Result {
  Result({
    this.id,
    this.createdAt,
    this.email,
    this.location,
    this.name,
    this.updatedAt,
  });

  String? id;
  DateTime? createdAt;
  String? email;
  String? location;
  String? name;
  DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        email: json["email"],
        location: json["location"],
        name: json["name"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "email": email,
        "location": location,
        "name": name,
        "updated_at": updatedAt!.toIso8601String(),
      };
}
