// To parse this JSON data, do
//
//     final cr = crFromJson(jsonString);

import 'dart:convert';

List<CR> crFromJson(String str) =>
    List<CR>.from(json.decode(str).map((x) => CR.fromJson(x)));

String crToJson(List<CR> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CR {
  CR({
    this.crMailId,
    this.semester,
  });

  String crMailId;
  String semester;

  factory CR.fromJson(Map<String, dynamic> json) => CR(
        crMailId: json["crMailId"],
        semester: json["semester"],
      );

  Map<String, dynamic> toJson() => {
        "crMailId": crMailId,
        "semester": semester,
      };
}
