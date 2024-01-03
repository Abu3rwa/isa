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
  var type;
  setUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("type", "teacher");
    type = prefs.getString("user-type");
    //  if(type==null){
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School App',
      theme: ThemeData(
          // primarySwatch: Colors.indigo,
          ),
      home: const SchoolHomePage(),
      onGenerateRoute: (settings) => generateRoutes(settings),
    );
  }
}
