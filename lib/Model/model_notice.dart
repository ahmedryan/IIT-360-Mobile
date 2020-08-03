// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Notice> noticeFromJson(String str) =>
    List<Notice>.from(json.decode(str).map((x) => Notice.fromJson(x)));

String noticeToJson(List<Notice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notice {
  String noticeId;
  String title;
  String section;
  String description;
  DateTime date;
  String time;
  String fkNoticeDocument;

  Notice({
    this.noticeId,
    this.title,
    this.section,
    this.description,
    this.date,
    this.time,
    this.fkNoticeDocument,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        noticeId: json["notice_id"],
        title: json["title"],
        section: json["section"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        fkNoticeDocument: json["fk_notice_document"],
      );

  Map<String, dynamic> toJson() => {
        "notice_id": noticeId,
        "title": title,
        "section": section,
        "description": description,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "fk_notice_document": fkNoticeDocument,
      };
}
