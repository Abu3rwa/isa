import 'package:flutter/material.dart';
import 'package:homeschooler/services/auth_service.dart';


class SignupScreen extends StatefulWidget {
  static const SignupScreenRoute = "/signupScreenRoute";

  const SignupScreen({super.key});
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final List<int> numbers = [6, 7, 8, 9, 10];
  int? selectedValue = 8;
  final double _height = 0;
  String? _selectedGender;
  final bool _visability = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _materialsController = TextEditingController();

  final bool _isLogin = true;
  bool _showPassword = true;
  @override
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          // height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(bottom: 30),
          color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage("assets/images/school-logo.png"),
                    height: 200,
                    width: 200,
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
                    labelText: 'Name',
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
                  controller: _nameController,
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
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
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
                child: TextField(
                  style: TextStyle(
                      color: Colors.green[800], fontWeight: FontWeight.bold),
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.email),
                    iconColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    labelText: 'Phone',
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
                  controller: _ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.email),
                    iconColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    labelText: 'Age',
                  ),
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
                    DropdownButton(
                      value: selectedValue,
                      onChanged: (int? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      items: numbers.map((number) {
                        return DropdownMenuItem(
                          value: number,
                          child: Text('$number'),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.cyan[600]),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () async {
                  AuthService().registerUser(
                      grades: [],
                      name: _nameController.text,
                      phone: int.parse(_phoneController.text),
                      gender: _genderController.text,
                      materials: [],
                      age: int.parse(_ageController.text),
                      grade: selectedValue as int,
                      password: _passwordController.text,
                      email: _emailController.text);
                },
                child: const Text(
                  'signup',
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
      ),
    );
  }

  void _showPasswordHandler() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
