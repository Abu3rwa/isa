import 'package:flutter/material.dart';
import 'package:homeschooler/models/quiz_model.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuizService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addTrueFalseQuiz({
    required List questions,
    required String material,
    required String title,
    required String dueDate,
    required int grade,
    required String instructions,
    required String type,
    required String note,
    required String teacher,
    required String dateDate,
    required String teacherEmail,
  }) async {
    try {
      await _firestore.collection("quizzes").doc().set({
        "questions": questions,
        "material": material,
        "grade": grade,
        "instructions": instructions,
        "type": type,
        "note": note,
        "title": title,
        "teacher": teacher,
        "studentsDid": [],
        "studentsDidnt": [],
        "teacherEmail": teacherEmail,
        "dueDate": dueDate,
      });
    } catch (err) {
      print(err);
    }
  }

  List<QuizModel> quizzesList = [];

  getQuizzesByMaterialAndGrade(material, grade) async {
    try {
      final snapshot = _firestore
          .collection('quizzes')
          .where('material', isEqualTo: material)
          .where('grade', isEqualTo: grade)
          .get();
      final quizzesSnapshot =
          await FirebaseFirestore.instance.collection('quizzes').get();
      final documents = quizzesSnapshot.docs as List;
      // final documents = snapshot.then((value) => value);
      // List quizzes = documents.toList();
      documents.forEach((quiz) {
        final data = quiz.data();
        quizzesList.add(QuizModel.fromJson(quiz.data(), quiz));
      });
      print(quizzesList);
      // notifyListeners();
    } catch (err) {}
  }

  deleteQuiz(id) async {
    print(id);

    try {
      _firestore.collection("quizzes").doc(id).delete();
    } catch (err) {}
  }
}
