// To parse this JSON data, do
//
//     final researchArea = researchAreaFromJson(jsonString);

import 'dart:convert';

List<ResearchArea> researchAreaFromJson(String str) => List<ResearchArea>.from(
    json.decode(str).map((x) => ResearchArea.fromJson(x)));

String researchAreaToJson(List<ResearchArea> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchArea {
  String researchAreaId;
  String fieldName;
  String areaDescription;

  ResearchArea({
    this.researchAreaId,
    this.fieldName,
    this.areaDescription,
  });

  factory ResearchArea.fromJson(Map<String, dynamic> json) => ResearchArea(
        researchAreaId: json["research_area_id"],
        fieldName: json["field_name"],
        areaDescription: json["area_description"],
      );

  Map<String, dynamic> toJson() => {
        "research_area_id": researchAreaId,
        "field_name": fieldName,
        "area_description": areaDescription,
      };
}
