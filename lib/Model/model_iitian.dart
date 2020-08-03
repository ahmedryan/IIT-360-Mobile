// To parse this JSON data, do
//
//     final iitian = iitianFromJson(jsonString);

import 'dart:convert';

List<IITIAN> iitianFromJson(String str) =>
    List<IITIAN>.from(json.decode(str).map((x) => IITIAN.fromJson(x)));

String iitianToJson(List<IITIAN> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IITIAN {
  IITIAN({
    this.iitianName,
    this.iitianMail,
    this.semesterCi,
    this.connected,
    this.lastUpdate,
  });

  String iitianName;
  String iitianMail;
  String semesterCi;
  int connected;
  DateTime lastUpdate;

  factory IITIAN.fromJson(Map<String, dynamic> json) => IITIAN(
        iitianName: json["iitianName"],
        iitianMail: json["iitianMail"],
        semesterCi: json["semesterCi"],
        connected: json["connected"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "iitianName": iitianName,
        "iitianMail": iitianMail,
        "semesterCi": semesterCi,
        "connected": connected,
        "lastUpdate": lastUpdate.toIso8601String(),
      };
}
