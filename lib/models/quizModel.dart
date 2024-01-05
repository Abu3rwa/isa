import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizModel {
  List questions;
  String material;
  int grade;
  String instructions;
  String type;
  String teacher;
  String dueDate;
  List studentsDid;
  List studentsDidnt;
  String note;
  QuizModel(
      {required this.questions,
      required this.material,
      required this.grade,
      required this.type,
      required this.teacher,
      required this.dueDate,
      required this.studentsDid,
      required this.studentsDidnt,
      required this.note,
      required this.instructions});

  Map<String, dynamic> toMap() {
    return {
      "questions": questions,
      "material": material,
      "grade": grade,
      "type": type,
      "teacher": teacher,
      "dueDate": dueDate,
      "studentsDid": studentsDid,
      "studentsDidnt": studentsDidnt,
      "note": note,
      "instructions": instructions
    };
  }

  static QuizModel fromJson(Map<String, dynamic> json) => QuizModel(
        questions: json["questions"] ?? [],
        material: json["material"] ?? "",
        grade: json["grade"] ?? 0,
        instructions: json["instructions"] ?? "",
        type: json["type"] ?? "",
        teacher: json["teacher"] ?? "",
        dueDate: json["dueDate"] ?? "",
        studentsDid: json["studentsDid"] ?? [],
        studentsDidnt: json["studentsDidnt"] ?? [],
        note: json["note"] ?? "",
      );

  String toJson() => json.encode(toMap());
}
