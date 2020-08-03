// To parse this JSON data, do
//
//     final projectScholarship = projectScholarshipFromJson(jsonString);

import 'dart:convert';

List<ProjectScholarship> projectScholarshipFromJson(String str) =>
    List<ProjectScholarship>.from(
        json.decode(str).map((x) => ProjectScholarship.fromJson(x)));

String projectScholarshipToJson(List<ProjectScholarship> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectScholarship {
  ProjectScholarship({
    this.projectId,
    this.proScholType,
    this.title,
    this.description,
    this.fkFacultyProject,
    this.fkFacultyProjectNavigation,
  });

  int projectId;
  String proScholType;
  String title;
  String description;
  String fkFacultyProject;
  dynamic fkFacultyProjectNavigation;

  factory ProjectScholarship.fromJson(Map<String, dynamic> json) =>
      ProjectScholarship(
        projectId: json["projectId"],
        proScholType: json["proScholType"],
        title: json["title"],
        description: json["description"],
        fkFacultyProject: json["fkFacultyProject"],
        fkFacultyProjectNavigation: json["fkFacultyProjectNavigation"],
      );

  Map<String, dynamic> toJson() => {
        "projectId": projectId,
        "proScholType": proScholType,
        "title": title,
        "description": description,
        "fkFacultyProject": fkFacultyProject,
        "fkFacultyProjectNavigation": fkFacultyProjectNavigation,
      };
}
