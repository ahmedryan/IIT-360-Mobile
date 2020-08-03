// To parse this JSON data, do
//
//     final publication = publicationFromJson(jsonString);

import 'dart:convert';

List<Publication> publicationFromJson(String str) => List<Publication>.from(
    json.decode(str).map((x) => Publication.fromJson(x)));

String publicationToJson(List<Publication> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Publication {
  Publication({
    this.publicationId,
    this.title,
    this.pubType,
    this.pubYear,
    this.facultyPublication,
    this.publicationDocument,
  });

  int publicationId;
  String title;
  String pubType;
  int pubYear;
  List<dynamic> facultyPublication;
  List<dynamic> publicationDocument;

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        publicationId: json["publicationId"],
        title: json["title"],
        pubType: json["pubType"],
        pubYear: json["pubYear"],
        facultyPublication:
            List<dynamic>.from(json["facultyPublication"].map((x) => x)),
        publicationDocument:
            List<dynamic>.from(json["publicationDocument"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "publicationId": publicationId,
        "title": title,
        "pubType": pubType,
        "pubYear": pubYear,
        "facultyPublication":
            List<dynamic>.from(facultyPublication.map((x) => x)),
        "publicationDocument":
            List<dynamic>.from(publicationDocument.map((x) => x)),
      };
}
