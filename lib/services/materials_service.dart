import 'package:cloud_firestore/cloud_firestore.dart';

class MaterialsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getMaterials() {
    try {
      _firestore
          .collection("materialsName")
          .snapshots()
          .map((snapshot) => print(snapshot.docs));
      // print("this is ::::::${materials}");
    } catch (err) {
      print(err);
    }
  }
}
