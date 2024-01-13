import 'package:flutter/material.dart';
import 'package:homeschooler/services/studentService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './signup_screen.dart';
import './students_screen.dart';
import './teacher_profile_screen.dart';

import '../widgets/studentInformation.dart';
import '../widgets/hero_buttons.dart';

class SchoolHomePage extends StatefulWidget {
  const SchoolHomePage({super.key});

  @override
  State<SchoolHomePage> createState() => _SchoolHomePageState();
}

class _SchoolHomePageState extends State<SchoolHomePage> {
  String? id;

  getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("currentUserId");
    print(prefs.getString("currentUserId"));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    Provider.of<StudentService>(context, listen: false)
        .getStudentProfile(id as String);
    final loadingStudent =
        Provider.of<StudentService>(context, listen: false).loading;
    final student = Provider.of<StudentService>(context, listen: false).student;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, SignupScreen.SignupScreenRoute);
          },
          child: const Text(
            'ISA School',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                  icon: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pushNamed(context,
                      TeacherProfileScreen.teacherProfileScreenRoute))),
        ],
      ),
      body: loadingStudent
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.cyan,
              ),
            )
          : Container(
              color: Colors.grey[100],
              height: double.infinity,
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StudentInformation(),
                    HeroButtons(),
                  ],
                ),
              ),
            ),
    );
  }
}
