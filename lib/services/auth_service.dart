import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  registerUser(
      {required String name,
      required String gender,
      required List materials,
      required int age,
      required List grades,
      required int grade,
      required int phone,
      required String password,
      required String email}) async {
    try {
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print({":::::::::::::::::::::::::": cred.user!.uid});
      print({
        ":::::::::::::::::::::::::": {
          "name": 'name',
          "email": 'email',
          "gender": 'gender',
          "phone": 8989898,
          "age": 13,
          "uid": cred.user!.uid,
          "grade": 8,
          "grades": [],
          "materials": [],
        }
      });
      await _firestore.collection("users").doc(cred.user!.uid).set({
        "name": name,
        "email": email,
        "gender": gender,
        "phone": 8989898,
        "age": 13,
        "uid": cred.user!.uid,
        "grade": 8,
        "grades": [],
        "materials": [],
      });
    } catch (err) {
      print(err);
    }
  }
}
