// To parse this JSON data, do
//
//     final routine = routineFromJson(jsonString);

import 'dart:convert';

List<Routine> routineFromJson(String str) =>
    List<Routine>.from(json.decode(str).map((x) => Routine.fromJson(x)));

String routineToJson(List<Routine> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Routine {
  Routine({
    this.routineId,
    this.date,
    this.courseCode,
    this.beginTime,
    this.endTime,
    this.semester,
    this.dayName,
    this.fkInstructorId,
  });

  int routineId;
  DateTime date;
  String courseCode;
  String beginTime;
  String endTime;
  String semester;
  String dayName;
  String fkInstructorId;

  factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        routineId: json["routineId"],
        date: DateTime.parse(json["date"]),
        courseCode: json["courseCode"],
        beginTime: json["beginTime"],
        endTime: json["endTime"],
        semester: json["semester"],
        dayName: json["dayname"],
        fkInstructorId: json["fkInstructorId"],
      );

  Map<String, dynamic> toJson() => {
        "routineId": routineId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "courseCode": courseCode,
        "beginTime": beginTime,
        "endTime": endTime,
        "semester": semester,
        "dayname": dayName,
        "fkInstructorId": fkInstructorId,
      };
}
