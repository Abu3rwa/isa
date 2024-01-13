import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:homeschooler/models/studentModel.dart';
import 'package:homeschooler/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentSnapshot? _documentSnapshot;
  var snapshot;
  var loading = true;
  StudentModel student = StudentModel(
      grades: [],
      name: '',
      id: '',
      phone: 0,
      summaries: [],
      quizzes: [],
      grade: 9,
      age: 13,
      gender: '',
      email: '');

  getStudentProfile(String documentId) async {
    try {
      _documentSnapshot =
          await _firestore.collection('students').doc(documentId).get();
      snapshot = _firestore.collection('students').doc(documentId).snapshots();

      final data = _documentSnapshot?.data() as Map<String, dynamic>;
      student = StudentModel.fromJson(data);

      loading = false;
      notifyListeners();
    } catch (e) {
      print('Error retrieving document: $e');
    }
  }

  DocumentSnapshot? get documentSnapshot => _documentSnapshot;
  // print(documentSnapshot);
  registerSudent(
      {required String name,
      required String gender,
      required int age,
      required int grade,
      required List summaries,
      required List quizzes,
      required int phone,
      required String password,
      required String email}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection("students").doc(cred.user!.uid).set({
        "name": name,
        "email": email,
        "gender": gender,
        "phone": 218917865665,
        "age": 13,
        "uid": cred.user!.uid,
        "grade": 8,
        "summaries": [],
        "quizzes": [],
      });
      print(cred.user!.uid);
      prefs.setString("currentUserId", cred.user!.uid);
    } catch (err) {
      print(err);
    }
  }
}
