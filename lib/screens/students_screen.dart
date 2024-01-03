import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentsScreen extends StatelessWidget {
  static const studentsScreenRoute = "/studentsScreenRoute";
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  StudentsScreen({super.key});
  // final CollectionReference studentsCollection =
  //     firestore.collection('students');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
        backgroundColor: Colors.cyan[800],
      ),
      body: Container(
        color: Colors.white,
        child: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("users").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                final data = document.data() as Map<String, dynamic>;
                final studentName = data['name'] as String;

                return ListTile(
                  title: Text(studentName),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
