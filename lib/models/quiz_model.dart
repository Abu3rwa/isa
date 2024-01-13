import 'dart:convert';

class QuizModel {
  List questions;
  String material;
  String title;
  String id;
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
      required this.title,
      required this.id,
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
      "title": title,
      "id": id,
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

  static QuizModel fromJson(Map<String, dynamic> json, quiz) => QuizModel(
        questions: json["questions"] ?? [],
        material: json["material"] ?? "",
        title: json["title"] ?? "",
        id: quiz.id ?? "",
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
