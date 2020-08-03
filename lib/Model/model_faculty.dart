// To parse this JSON data, do
//
//     final faculty = facultyFromJson(jsonString);

import 'dart:convert';

List<Faculty> facultyFromJson(String str) =>
    List<Faculty>.from(json.decode(str).map((x) => Faculty.fromJson(x)));

String facultyToJson(List<Faculty> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faculty {
  String facultyId;
  String name;
  String designation;
  String qualification;
  String links;
  Status status;
  String aboutMe;
  String teachings;
  String fkFacultyImage;

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
  });

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
        facultyId: json["faculty_id"],
        name: json["name"],
        designation: json["designation"] == null ? null : json["designation"],
        qualification:
            json["qualification"] == null ? null : json["qualification"],
        links: json["links"] == null ? null : json["links"],
        status: statusValues.map[json["status"]],
        aboutMe: json["about_me"] == null ? null : json["about_me"],
        teachings: json["teachings"],
        fkFacultyImage: json["fk_faculty_image"],
      );

  Map<String, dynamic> toJson() => {
        "faculty_id": facultyId,
        "name": name,
        "designation": designation == null ? null : designation,
        "qualification": qualification == null ? null : qualification,
        "links": links == null ? null : links,
        "status": statusValues.reverse[status],
        "about_me": aboutMe == null ? null : aboutMe,
        "teachings": teachings,
        "fk_faculty_image": fkFacultyImage,
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
