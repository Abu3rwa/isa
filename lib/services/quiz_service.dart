import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuizService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addTrueFalseQuiz({
    required List questions,
    required String material,
    required int grade,
    required String instructions,
    required String type,
    required String note,
    required String teacher,
    required String teacherEmail,
    required String typeOfQuestion,
  }) async {
    try {
      print({});
      await _firestore.collection("quizzes").doc().set({
        "questions": questions,
        "material": material,
        "grade": grade,
        "instructions": instructions,
        "type": type,
        "note": note,
        "teacher": teacher,
        "teacherEmail": teacherEmail,
        "typeOfQuestion": typeOfQuestion,
      });
    } catch (err) {
      print(err);
    }
  }
}
