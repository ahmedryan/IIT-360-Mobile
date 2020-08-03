// To parse this JSON data, do
//
//     final institution = institutionFromJson(jsonString);

import 'dart:convert';

List<Institution> institutionFromJson(String str) => List<Institution>.from(
    json.decode(str).map((x) => Institution.fromJson(x)));

String institutionToJson(List<Institution> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Institution {
  String institutionId;
  String instHeader;
  String instDescription;
  String fkInstImage;

  Institution({
    this.institutionId,
    this.instHeader,
    this.instDescription,
    this.fkInstImage,
  });

  factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        institutionId: json["institution_id"],
        instHeader: json["inst_header"],
        instDescription: json["inst_description"],
        fkInstImage: json["fk_inst_image"],
      );

  Map<String, dynamic> toJson() => {
        "institution_id": institutionId,
        "inst_header": instHeader,
        "inst_description": instDescription,
        "fk_inst_image": fkInstImage,
      };
}
