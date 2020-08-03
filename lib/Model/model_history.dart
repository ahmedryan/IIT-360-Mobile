// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  String historyId;
  String headingText;
  String directorName;
  String actFrom;
  String actTo;
  String rohTable;

  History({
    this.historyId,
    this.headingText,
    this.directorName,
    this.actFrom,
    this.actTo,
    this.rohTable,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        historyId: json["history_id"],
        headingText: json["heading_text"],
        directorName: json["director_name"],
        actFrom: json["act_from"],
        actTo: json["act_to"],
        rohTable: json["roh_table"],
      );

  Map<String, dynamic> toJson() => {
        "history_id": historyId,
        "heading_text": headingText,
        "director_name": directorName,
        "act_from": actFrom,
        "act_to": actTo,
        "roh_table": rohTable,
      };
}
