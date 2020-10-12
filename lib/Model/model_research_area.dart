// To parse this JSON data, do
//
//     final researchArea = researchAreaFromJson(jsonString);

import 'dart:convert';

List<ResearchArea> researchAreaFromJson(String str) => List<ResearchArea>.from(
    json.decode(str).map((x) => ResearchArea.fromJson(x)));

String researchAreaToJson(List<ResearchArea> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchArea {
  ResearchArea({
    this.researchAreaId,
    this.fieldName,
    this.areaDescription,
  });

  int researchAreaId;
  String fieldName;
  String areaDescription;

  factory ResearchArea.fromJson(Map<String, dynamic> json) => ResearchArea(
        researchAreaId: json["researchAreaId"],
        fieldName: json["fieldName"],
        areaDescription: json["areaDescription"],
      );

  Map<String, dynamic> toJson() => {
        "researchAreaId": researchAreaId,
        "fieldName": fieldName,
        "areaDescription": areaDescription,
      };
}
