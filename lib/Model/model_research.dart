// To parse this JSON data, do
//
//     final research = researchFromJson(jsonString);

import 'dart:convert';

List<Research> researchFromJson(String str) =>
    List<Research>.from(json.decode(str).map((x) => Research.fromJson(x)));

String researchToJson(List<Research> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Research {
  String researchId;
  String title;
  String description;
  String fkFacultyResearch;

  Research({
    this.researchId,
    this.title,
    this.description,
    this.fkFacultyResearch,
  });

  factory Research.fromJson(Map<String, dynamic> json) => Research(
        researchId: json["research_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        fkFacultyResearch: json["fk_faculty_research"],
      );

  Map<String, dynamic> toJson() => {
        "research_id": researchId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "fk_faculty_research": fkFacultyResearch,
      };
}
