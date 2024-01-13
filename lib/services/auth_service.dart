import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  registerTeacher(
      {required String name,
      required List grades,
      required int phone,
      required String password,
      required String email}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection("users").doc(cred.user!.uid).set({
        "name": name,
        "email": email,
        "phone": 218917865665,
        "uid": cred.user!.uid,
        "grades": [],
      });

      prefs.setString("currentUserId", cred.user!.uid);
    } catch (err) {
      print(err);
    }
  }
}
