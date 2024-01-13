import 'package:flutter/material.dart';
import 'package:homeschooler/services/auth_service.dart';
import 'package:homeschooler/services/studentService.dart';
import 'package:homeschooler/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  static const SignupScreenRoute = "/signupScreenRoute";

  const SignupScreen({super.key});
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final List<Map<String, dynamic>> materials = [
    {"grade": 6, "material": "English"},
    {"grade": 7, "material": "English"},
    {"grade": 8, "material": "English"},
    {"grade": 9, "material": "English"},
    {"grade": 10, "material": "English"},
    {"grade": 6, "material": "Computer Science"},
    {"grade": 7, "material": "Computer Science"},
    {"grade": 8, "material": "Computer Science"},
    {"grade": 9, "material": "Computer Science"},
    {"grade": 10, "material": "Computer Science"},
    {"grade": 6, "material": "Math"},
    {"grade": 7, "material": "Math"},
    {"grade": 8, "material": "Math"},
    {"grade": 9, "material": "Math"},
    {"grade": 10, "material": "Math"},
  ];
  List materialsITeach = [];
  int? selectedNumber = 8;
  String? selectedGender = "male";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _materialsController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  bool _showPassword = true;
  var userType = "Student";
  @override
  getUserType() async {
    // final prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   userType = prefs.getString("userType");
    // });
  }

  addMaterialITeach(material, grade) {
    materialsITeach.add({"material": material, "grade": grade});
    setState(() {});
  }

  setUserType(type) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString("userType", type);
  }

  Widget build(BuildContext context) {
    getUserType();
    print(userType);
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
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.person),
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
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
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
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
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
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.phone),
                    iconColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    labelText: 'Phone',
                  ),
                ),
              ),
              userType == "Teacher"
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Wrap(
                              spacing: 10,
                              runSpacing: 3,
                              children: materialsITeach
                                  .map((material) => Card(
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text.rich(TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${material["material"]} ",
                                              ),
                                              TextSpan(
                                                text: material["grade"]
                                                    .toString(),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ))
                                  .toList()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'materials you Teach',
                            style: TextStyle(
                                color: MyAppTheme.darkTextColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                                letterSpacing: 3,
                                fontSize: 20),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Wrap(
                                  spacing: 10,
                                  runSpacing: 3,
                                  children: materials
                                      .map((material) => ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.cyan[800]),
                                                foregroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.white)),
                                            onPressed: () {
                                              addMaterialITeach(
                                                  material["material"],
                                                  material["grade"]);
                                            },
                                            child: Container(
                                              child: Text.rich(TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "${material["material"]} ",
                                                  ),
                                                  TextSpan(
                                                    text: material["grade"]
                                                        .toString(),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ))
                                      .toList()),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: TextField(
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            controller: _ageController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              suffixIcon: Icon(Icons.child_care),
                              iconColor: Colors.white,
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                              labelText: 'Age',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(7),
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Gender"),
                              DropdownButton<String>(
                                value: selectedGender,
                                icon: Icon(Icons.arrow_drop_down_rounded),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.cyan[800],
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                underline: Container(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedGender = newValue;
                                  });
                                },
                                items: <String>[
                                  "male",
                                  "female"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(7),
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Grade"),
                              DropdownButton<int>(
                                value: selectedNumber,
                                icon: Icon(Icons.arrow_drop_down_rounded),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.cyan[800],
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                underline: Container(),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    selectedNumber = newValue;
                                  });
                                },
                                items: <int>[7, 8, 9, 10]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[600]),
                        elevation: MaterialStateProperty.all(0)),
                    onPressed: () async {
                      userType == "Teacher"
                          ? AuthService().registerTeacher(
                              grades: [],
                              name: _nameController.text,
                              phone: int.parse(_phoneController.text),
                              password: _passwordController.text,
                              email: _emailController.text)
                          : StudentService().registerSudent(
                              name: _nameController.text,
                              phone: int.parse(_phoneController.text),
                              gender: selectedGender as String,
                              quizzes: [],
                              summaries: [],
                              age: int.parse(_ageController.text),
                              grade: selectedNumber as int,
                              password: _passwordController.text,
                              email: _emailController.text);
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text(
                      'signup',
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'have an account?   log In ',
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ),
                ],
              )
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
