// To parse this JSON data, do
//
//     final objective = objectiveFromJson(jsonString);

import 'dart:convert';

List<Objective> objectiveFromJson(String str) =>
    List<Objective>.from(json.decode(str).map((x) => Objective.fromJson(x)));

String objectiveToJson(List<Objective> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Objective {
  Objective({
    this.anoId,
    this.aim,
  });

  int anoId;
  String aim;

  factory Objective.fromJson(Map<String, dynamic> json) => Objective(
        anoId: json["anoId"],
        aim: json["aim"],
      );

  Map<String, dynamic> toJson() => {
        "anoId": anoId,
        "aim": aim,
      };
}
