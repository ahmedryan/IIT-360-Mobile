// To parse this JSON data, do
//
//     final academic = academicFromJson(jsonString);

import 'dart:convert';

List<Academic> academicFromJson(String str) =>
    List<Academic>.from(json.decode(str).map((x) => Academic.fromJson(x)));

String academicToJson(List<Academic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Academic {
  Academic({
    this.academicId,
    this.academicSection,
    this.programs,
    this.academicInfo,
    this.academicAdmission,
    this.academicDocument,
  });

  int academicId;
  String academicSection;
  String programs;
  String academicInfo;
  String academicAdmission;
  List<dynamic> academicDocument;

  factory Academic.fromJson(Map<String, dynamic> json) => Academic(
        academicId: json["academicId"],
        academicSection: json["academicSection"],
        programs: json["programs"],
        academicInfo: json["academicInfo"],
        academicAdmission: json["academicAdmission"],
        academicDocument:
            List<dynamic>.from(json["academicDocument"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "academicId": academicId,
        "academicSection": academicSection,
        "programs": programs,
        "academicInfo": academicInfo,
        "academicAdmission": academicAdmission,
        "academicDocument": List<dynamic>.from(academicDocument.map((x) => x)),
      };
}
