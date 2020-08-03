// To parse this JSON data, do
//
//     final industry = industryFromJson(jsonString);

import 'dart:convert';

List<Industry> industryFromJson(String str) =>
    List<Industry>.from(json.decode(str).map((x) => Industry.fromJson(x)));

String industryToJson(List<Industry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Industry {
  Industry({
    this.industryId,
    this.featured,
    this.industryName,
    this.indIcon,
    this.indLink,
    this.indIconNavigation,
  });

  int industryId;
  int featured;
  String industryName;
  int indIcon;
  String indLink;
  dynamic indIconNavigation;

  factory Industry.fromJson(Map<String, dynamic> json) => Industry(
        industryId: json["industryId"],
        featured: json["featured"],
        industryName: json["industryName"],
        indIcon: json["indIcon"],
        indLink: json["indLink"] == null ? null : json["indLink"],
        indIconNavigation: json["indIconNavigation"],
      );

  Map<String, dynamic> toJson() => {
        "industryId": industryId,
        "featured": featured,
        "industryName": industryName,
        "indIcon": indIcon,
        "indLink": indLink == null ? null : indLink,
        "indIconNavigation": indIconNavigation,
      };
}
