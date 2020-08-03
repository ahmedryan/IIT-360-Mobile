// To parse this JSON data, do
//
//     final achievement = achievementFromJson(jsonString);

import 'dart:convert';

List<Achievement> achievementFromJson(String str) => List<Achievement>.from(
    json.decode(str).map((x) => Achievement.fromJson(x)));

String achievementToJson(List<Achievement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Achievement {
  String achievementId;
  String title;
  String description;
  DateTime date;
  String venue;
  String fkAchievementImage;
  String imageCaption;

  Achievement({
    this.achievementId,
    this.title,
    this.description,
    this.date,
    this.venue,
    this.fkAchievementImage,
    this.imageCaption,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        achievementId: json["achievement_id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        venue: json["venue"],
        fkAchievementImage: json["fk_achievement_image"],
        imageCaption: json["image_caption"],
      );

  Map<String, dynamic> toJson() => {
        "achievement_id": achievementId,
        "title": title,
        "description": description,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "venue": venue,
        "fk_achievement_image": fkAchievementImage,
        "image_caption": imageCaption,
      };
}
