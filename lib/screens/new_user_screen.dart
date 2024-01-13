import 'package:flutter/material.dart';
import 'package:homeschooler/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  setUserType(type) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString("userType", type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(""),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/paper.jpg"),
          ),
        ),
        child: Container(
          color: Color.fromARGB(175, 1, 62, 80),
          child: Column(children: [
            const SizedBox(
              height: 70,
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              child: Image(
                image: AssetImage("assets/images/school-logo.png"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Welcome to ISA School",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              "What's your role?",
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 20,
                    child: TextButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        setUserType("Teacher");
                        Navigator.pushNamed(
                            context, SignupScreen.SignupScreenRoute);
                      },
                      child: Text(
                        "Teacher",
                        style: TextStyle(
                            color: Colors.deepPurple[800],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: MediaQuery.of(context).size.width / 3,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        setUserType("Student");
                        Navigator.pushNamed(
                            context, SignupScreen.SignupScreenRoute);
                      },
                      child: Text(
                        "Student",
                        style: TextStyle(
                            color: Colors.deepPurple[800],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 20,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        setUserType("Parent");
                        Navigator.pushNamed(
                            context, SignupScreen.SignupScreenRoute);
                      },
                      child: Text(
                        "Parent",
                        style: TextStyle(
                            color: Colors.deepPurple[800],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
