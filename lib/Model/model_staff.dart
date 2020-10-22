// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

List<Staff> staffFromJson(String str) =>
    List<Staff>.from(json.decode(str).map((x) => Staff.fromJson(x)));

String staffToJson(List<Staff> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Staff {
  Staff({
    this.staffsId,
    this.name,
    this.designation,
    this.fkStaffImage,
    this.fkStaffImageNavigation,
  });

  int staffsId;
  String name;
  String designation;
  int fkStaffImage;
  dynamic fkStaffImageNavigation;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        staffsId: json["staffsId"],
        name: json["name"],
        designation: json["designation"],
        fkStaffImage: json["fkStaffImage"],
        fkStaffImageNavigation: json["fkStaffImageNavigation"],
      );

  Map<String, dynamic> toJson() => {
        "staffsId": staffsId,
        "name": name,
        "designation": designation,
        "fkStaffImage": fkStaffImage,
        "fkStaffImageNavigation": fkStaffImageNavigation,
      };
}
