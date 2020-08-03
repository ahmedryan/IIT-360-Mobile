// To parse this JSON data, do
//
//     final facultyPublication = facultyPublicationFromJson(jsonString);

import 'dart:convert';

List<FacultyPublication> facultyPublicationFromJson(String str) =>
    List<FacultyPublication>.from(
        json.decode(str).map((x) => FacultyPublication.fromJson(x)));

String facultyPublicationToJson(List<FacultyPublication> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FacultyPublication {
  FacultyPublication({
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
  List<FacultyPublicationElement> facultyPublication;
  List<dynamic> publicationDocument;

  factory FacultyPublication.fromJson(Map<String, dynamic> json) =>
      FacultyPublication(
        publicationId: json["publicationId"],
        title: json["title"],
        pubType: json["pubType"],
        pubYear: json["pubYear"],
        facultyPublication: List<FacultyPublicationElement>.from(
            json["facultyPublication"]
                .map((x) => FacultyPublicationElement.fromJson(x))),
        publicationDocument:
            List<dynamic>.from(json["publicationDocument"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "publicationId": publicationId,
        "title": title,
        "pubType": pubType,
        "pubYear": pubYear,
        "facultyPublication":
            List<dynamic>.from(facultyPublication.map((x) => x.toJson())),
        "publicationDocument":
            List<dynamic>.from(publicationDocument.map((x) => x)),
      };
}

class FacultyPublicationElement {
  FacultyPublicationElement({
    this.facPubId,
    this.fkFacultyFacpub,
    this.fkPublicationFacpub,
    this.fkFacultyFacpubNavigation,
  });

  int facPubId;
  String fkFacultyFacpub;
  int fkPublicationFacpub;
  dynamic fkFacultyFacpubNavigation;

  factory FacultyPublicationElement.fromJson(Map<String, dynamic> json) =>
      FacultyPublicationElement(
        facPubId: json["facPubId"],
        fkFacultyFacpub: json["fkFacultyFacpub"],
        fkPublicationFacpub: json["fkPublicationFacpub"],
        fkFacultyFacpubNavigation: json["fkFacultyFacpubNavigation"],
      );

  Map<String, dynamic> toJson() => {
        "facPubId": facPubId,
        "fkFacultyFacpub": fkFacultyFacpub,
        "fkPublicationFacpub": fkPublicationFacpub,
        "fkFacultyFacpubNavigation": fkFacultyFacpubNavigation,
      };
}
