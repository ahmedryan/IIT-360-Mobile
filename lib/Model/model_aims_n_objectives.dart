// To parse this JSON data, do
//
//     final aimsNObjectives = aimsNObjectivesFromJson(jsonString);

import 'dart:convert';

List<Objective> aimsNObjectivesFromJson(String str) =>
    List<Objective>.from(json.decode(str).map((x) => Objective.fromJson(x)));

String aimsNObjectivesToJson(List<Objective> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Objective {
  String anoId;
  String aim;

  Objective({
    this.anoId,
    this.aim,
  });

  factory Objective.fromJson(Map<String, dynamic> json) => Objective(
        anoId: json["ano_id"],
        aim: json["aim"],
      );

  Map<String, dynamic> toJson() => {
        "ano_id": anoId,
        "aim": aim,
      };
}
