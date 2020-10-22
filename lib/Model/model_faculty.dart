// To parse this JSON data, do
//
//     final faculty = facultyFromJson(jsonString);

import 'dart:convert';

List<Faculty> facultyFromJson(String str) =>
    List<Faculty>.from(json.decode(str).map((x) => Faculty.fromJson(x)));

String facultyToJson(List<Faculty> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faculty {
  Faculty({
    this.facultyId,
    this.name,
    this.designation,
    this.qualification,
    this.links,
    this.status,
    this.aboutMe,
    this.teachings,
    this.fkFacultyImage,
    this.fkFacultyImageNavigation,
    this.facultyPublication,
    this.projectScholarship,
    this.research,
  });

  String facultyId;
  String name;
  String designation;
  String qualification;
  String links;
  Status status;
  String aboutMe;
  String teachings;
  int fkFacultyImage;
  dynamic fkFacultyImageNavigation;
  List<dynamic> facultyPublication;
  List<dynamic> projectScholarship;
  List<dynamic> research;

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
        facultyId: json["facultyId"],
        name: json["name"],
        designation: json["designation"] == null ? null : json["designation"],
        qualification:
            json["qualification"] == null ? null : json["qualification"],
        links: json["links"] == null ? null : json["links"],
        status: statusValues.map[json["status"]],
        aboutMe: json["aboutMe"] == null ? null : json["aboutMe"],
        teachings: json["teachings"],
        fkFacultyImage: json["fkFacultyImage"],
        fkFacultyImageNavigation: json["fkFacultyImageNavigation"],
        facultyPublication:
            List<dynamic>.from(json["facultyPublication"].map((x) => x)),
        projectScholarship:
            List<dynamic>.from(json["projectScholarship"].map((x) => x)),
        research: List<dynamic>.from(json["research"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "facultyId": facultyId,
        "name": name,
        "designation": designation == null ? null : designation,
        "qualification": qualification == null ? null : qualification,
        "links": links == null ? null : links,
        "status": statusValues.reverse[status],
        "aboutMe": aboutMe == null ? null : aboutMe,
        "teachings": teachings,
        "fkFacultyImage": fkFacultyImage,
        "fkFacultyImageNavigation": fkFacultyImageNavigation,
        "facultyPublication":
            List<dynamic>.from(facultyPublication.map((x) => x)),
        "projectScholarship":
            List<dynamic>.from(projectScholarship.map((x) => x)),
        "research": List<dynamic>.from(research.map((x) => x)),
      };
}

enum Status { FORMER, ON_STUDY_LEAVE, ON_DUTY }

final statusValues = EnumValues({
  "Former": Status.FORMER,
  "On Duty": Status.ON_DUTY,
  "On Study Leave": Status.ON_STUDY_LEAVE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
