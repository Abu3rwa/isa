import 'package:flutter/material.dart';
import 'package:homeschooler/screens/add_true_false_question.dart';
import 'package:homeschooler/screens/choose_type_of_question.dart';
import '../screens/material_management_screen.dart';
import '../screens/students_screen.dart';
import '../screens/teacher_profile_screen.dart';
import '../screens/materials-screen.dart';
import '../screens/settings_screen.dart';
import '../screens/signup_screen.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SettingsScreen.settingssScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return const SettingsScreen();
          },
          settings: routeSettings);
    case SignupScreen.SignupScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return const SignupScreen();
          },
          settings: routeSettings);
    case MaterialsScreen.materialsScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return const MaterialsScreen();
          },
          settings: routeSettings);
    case StudentsScreen.studentsScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return StudentsScreen();
          },
          settings: routeSettings);
    case TeacherProfileScreen.teacherProfileScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return TeacherProfileScreen();
          },
          settings: routeSettings);
    case MaterialManageMentScreen.materialManageMentScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return MaterialManageMentScreen();
          },
          settings: routeSettings);
    case ChooseTypeOfQuestionScreen.chooseTypeOfQuestionScreen:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return ChooseTypeOfQuestionScreen();
          },
          settings: routeSettings);
    case AddTrueFalseQuestion.addTrueFalseQuestionRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) {
            return AddTrueFalseQuestion();
          },
          settings: routeSettings);

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
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
