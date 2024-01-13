import 'package:flutter/material.dart';
import 'package:homeschooler/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const loginScreenRoute = "/loginScreenRoute";

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = true;

  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "ISA School",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
              letterSpacing: 3,
              fontSize: 30),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        // height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(bottom: 30),
        color: Colors.grey[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(
                  image: AssetImage("assets/images/school-logo.png"),
                  height: 70,
                  width: 70,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.cyan[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
              child: TextField(
                style: TextStyle(
                    color: Colors.green[800], fontWeight: FontWeight.bold),
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: Icon(Icons.email),
                  iconColor: Colors.white,
                  labelStyle: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                  labelText: 'email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
              child: TextField(
                style: TextStyle(
                    color: Colors.green[800], fontWeight: FontWeight.bold),
                controller: _passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: IconButton(
                      icon: Icon(!_showPassword
                          ? Icons.visibility_off
                          : Icons.remove_red_eye),
                      onPressed: _showPasswordHandler),
                  iconColor: Colors.white,
                  labelStyle: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                  labelText: 'password',
                ),
                obscureText: _showPassword,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(" Grade "),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.cyan[600]),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () async {},
              child: const Text(
                'Login',
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'have an account?   log In ',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPasswordHandler() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
