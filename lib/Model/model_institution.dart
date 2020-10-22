// To parse this JSON data, do
//
//     final institution = institutionFromJson(jsonString);

import 'dart:convert';

List<Institution> institutionFromJson(String str) => List<Institution>.from(
    json.decode(str).map((x) => Institution.fromJson(x)));

String institutionToJson(List<Institution> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Institution {
  Institution({
    this.institutionId,
    this.instHeader,
    this.instDescription,
    this.fkInstImage,
    this.fkInstImageNavigation,
  });

  int institutionId;
  String instHeader;
  String instDescription;
  int fkInstImage;
  dynamic fkInstImageNavigation;

  factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        institutionId: json["institutionId"],
        instHeader: json["instHeader"],
        instDescription: json["instDescription"],
        fkInstImage: json["fkInstImage"],
        fkInstImageNavigation: json["fkInstImageNavigation"],
      );

  Map<String, dynamic> toJson() => {
        "institutionId": institutionId,
        "instHeader": instHeader,
        "instDescription": instDescription,
        "fkInstImage": fkInstImage,
        "fkInstImageNavigation": fkInstImageNavigation,
      };
}
