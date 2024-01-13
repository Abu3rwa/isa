import 'dart:convert';

class StudentModel {
  List grades;
  String name;
  int phone;
  int grade;
  String email;
  int age;
  String gender;
  String id;
  List summaries;
  List quizzes;
  StudentModel(
      {required this.grades,
      required this.name,
      required this.id,
      required this.phone,
      required this.summaries,
      required this.quizzes,
      required this.grade,
      required this.age,
      required this.gender,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      "grades": grades,
      "name": name,
      "id": id,
      "phone": phone,
      "summaries": summaries,
      "quizzes": quizzes,
      "grade": grade,
      "age": age,
      "gender": gender,
      "email": email
    };
  }

  static StudentModel fromJson(Map<String, dynamic> json) => StudentModel(
        grades: json["grades"] ?? [],
        name: json["name"] ?? "",
        id: json["uid"] ?? "",
        phone: json["phone"] ?? 0,
        summaries: json["summaries"] ?? 0,
        quizzes: json["quizzes"] ?? 0,
        grade: json["grade"] ?? 0,
        email: json["email"] ?? "",
        age: json["age"] ?? 0,
        gender: json["gender"] ?? [],
      );

  String toJson() => json.encode(toMap());
}
