import 'dart:convert';

RegisterResidentResponse RegisterResidentResponseFromJson(String str) => RegisterResidentResponse.fromJson(json.decode(str));

String RegisterResidentResponseToJson(RegisterResidentResponse data) => json.encode(data.toJson());

class RegisterResidentResponse {
  Result ?result;
  int ?status;

  RegisterResidentResponse({this.result, this.status});

  RegisterResidentResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String ?date;
  String ?dateOfBirth;
  String ?indentityCard;
  String ?location;
  String ?name;
  String ?relationship;
  String ?sex;

  Result(
      {this.date,
        this.dateOfBirth,
        this.indentityCard,
        this.location,
        this.name,
        this.relationship,
        this.sex});

  Result.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateOfBirth = json['date_of_birth'];
    indentityCard = json['indentity_card'];
    location = json['location'];
    name = json['name'];
    relationship = json['relationship'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['date_of_birth'] = this.dateOfBirth;
    data['indentity_card'] = this.indentityCard;
    data['location'] = this.location;
    data['name'] = this.name;
    data['relationship'] = this.relationship;
    data['sex'] = this.sex;
    return data;
  }
}
