import 'package:homeschooler/screens/new_user_screen.dart';
import 'package:homeschooler/services/studentService.dart';
import 'package:homeschooler/services/teacherService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './widgets/routes.dart';
import '../screens/home.dart';
import "./firebase_options.dart";

// Platform  Firebase App Id
// web       1:300513347780:web:a2b8144329a926c84f6191
// android   1:300513347780:android:332376ff893783774f6191
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? type;
  setUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("type", "teacher");
    type = prefs.getString("user-type");
    if (type == null) {
      isNewUser = false;
    }
  }

  var isNewUser = true;
  String? userType;
  @override
  Widget build(BuildContext context) {
    getUserType() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        userType = prefs.getString("userType");
      });
      if (userType != null) {
        setState(() {
          isNewUser = false;
        });
      } else {
        isNewUser = true;
      }
    }

    getUserType();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TeacherService()),
        ChangeNotifierProvider(create: (context) => StudentService()),
      ],
      child: MaterialApp(
        title: 'School App',
        theme: ThemeData(
            // primarySwatch: Colors.indigo,
            ),
        home: isNewUser ? const NewUserScreen() : SchoolHomePage(),
        onGenerateRoute: (settings) => generateRoutes(settings),
      ),
    );
  }
}
