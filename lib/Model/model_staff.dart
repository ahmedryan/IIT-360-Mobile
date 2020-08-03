// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

List<Staff> staffFromJson(String str) =>
    List<Staff>.from(json.decode(str).map((x) => Staff.fromJson(x)));

String staffToJson(List<Staff> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Staff {
  String staffsId;
  String name;
  String designation;
  String fkStaffImage;

  Staff({
    this.staffsId,
    this.name,
    this.designation,
    this.fkStaffImage,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        staffsId: json["staffs_id"],
        name: json["name"],
        designation: json["designation"],
        fkStaffImage: json["fk_staff_image"],
      );

  Map<String, dynamic> toJson() => {
        "staffs_id": staffsId,
        "name": name,
        "designation": designation,
        "fk_staff_image": fkStaffImage,
      };
}
