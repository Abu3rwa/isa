import 'package:flutter/material.dart';
import '../screens/material_management_screen.dart';
import '../screens/students_screen.dart';
import '../screens/teacher_profile_screen.dart';
import '../screens/materials-screen.dart';
import '../screens/settings_screen.dart';
import '../screens/signup_screen.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SettingsScreen.settingssScreenRoute:
      return MaterialPageRoute(builder: (_) => const SettingsScreen());
    case SignupScreen.SignupScreenRoute:
      return MaterialPageRoute(builder: (_) => const SignupScreen());
    case MaterialsScreen.materialsScreenRoute:
      return MaterialPageRoute(builder: (_) => const MaterialsScreen());
    case StudentsScreen.studentsScreenRoute:
      return MaterialPageRoute(builder: (_) => StudentsScreen());
    case TeacherProfileScreen.teacherProfileScreenRoute:
      return MaterialPageRoute(builder: (_) => const TeacherProfileScreen());
    case MaterialManageMentScreen.materialManageMentScreenRoute:
      return MaterialPageRoute(builder: (_) => MaterialManageMentScreen());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                    child: Column(
                  children: [
                    Text(
                      "Not Found",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                    ),
                    Image(
                      image: AssetImage("assets/images/school-logo.png"),
                      height: 200,
                      width: 200,
                    ),
                  ],
                )),
              ));
  }
}
