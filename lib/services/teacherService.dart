import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:homeschooler/models/user_model.dart';

class TeacherService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentSnapshot? _documentSnapshot;
  var snapshot;
  var loading = true;
  UserModel teacher = UserModel(
      grades: [], name: '', phone: 0, grade: 0, age: 0, gender: '', email: '');
  getTeachersProfile(String documentId) async {
    try {
      _documentSnapshot =
          await _firestore.collection('teachers').doc(documentId).get();
      snapshot = _firestore.collection('teachers').doc(documentId).snapshots();

      final data = _documentSnapshot?.data() as Map<String, dynamic>;
      teacher = UserModel.fromJson(data);
      loading = false;
      notifyListeners();
    } catch (e) {
      print('Error retrieving document: $e');
    }
  }

  DocumentSnapshot? get documentSnapshot => _documentSnapshot;
  // print(documentSnapshot);
}
