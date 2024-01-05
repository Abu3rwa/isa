import 'dart:convert';

class UserModel {
  List grades;
  String name;
  int phone;
  int grade;
  String email;
  int age;
  String gender;
  UserModel(
      {required this.grades,
      required this.name,
      required this.phone,
      required this.grade,
      required this.age,
      required this.gender,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      "grades": grades,
      "name": name,
      "phone": phone,
      "grade": grade,
      "age": age,
      "gender": gender,
      "email": email
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        grades: json["grades"] ?? [],
        name: json["name"] ?? "",
        phone: json["phone"] ?? 0,
        grade: json["grade"] ?? 0,
        email: json["email"] ?? "",
        age: json["age"] ?? 0,
        gender: json["gender"] ?? [],
      );

  String toJson() => json.encode(toMap());
}
