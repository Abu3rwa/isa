import 'package:flutter/material.dart';
import './signup_screen.dart';
import './students_screen.dart';
import './teacher_profile_screen.dart';

import '../widgets/greeting_msg.dart';
import '../widgets/hero_buttons.dart';

class SchoolHomePage extends StatelessWidget {
  const SchoolHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.amberAccent,
                  ),
                  onPressed: () => Navigator.pushNamed(context,
                      TeacherProfileScreen.teacherProfileScreenRoute))),
        ],
      ),
      body: Container(
        color: Colors.blueGrey[50],
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingMsg(),
              MaterialButton(
                  child: const Text("students"),
                  onPressed: () => Navigator.pushNamed(
                      context, StudentsScreen.studentsScreenRoute)),

              // onPressed: () => MaterialsService().getMaterials()),
              const HeroButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
