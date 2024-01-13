import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeschooler/models/user_model.dart';
import 'package:homeschooler/screens/material_management_screen.dart';
import 'package:homeschooler/services/teacherService.dart';
import 'package:homeschooler/utils/theme.dart';
import 'package:homeschooler/widgets/appbar.dart';
import 'package:provider/provider.dart';

class TeacherProfileScreen extends StatefulWidget {
  TeacherProfileScreen();
  static const teacherProfileScreenRoute = '/teacherProfileScreenRoute';

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Provider.of<TeacherService>(context, listen: false)
        .getTeachersProfile("CIQbajmxp77CvdRGy5Bu");
    final teacher = Provider.of<TeacherService>(context, listen: false).teacher;
    final loading = Provider.of<TeacherService>(context, listen: false).loading;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        elevation: 0,
        title: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10.0),
            color: MyAppTheme.mainBg,
            child: loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: Image(
                                image:
                                    AssetImage("assets/images/school-logo.png"),
                              ),
                            ),
                            TextButton.icon(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blueGrey),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              label: const Text("Logout"),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.logout,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.grey[200],
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  teacher.gender == "male"
                                      ? "Mr. ${teacher.name}"
                                      : "Ms. ${teacher.name}",
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton.icon(
                                    label: Text(
                                      teacher.email,
                                    ),
                                    icon: const Icon(Icons.email),
                                    onPressed: () {},
                                  ),
                                  TextButton.icon(
                                    label: Text(teacher.phone.toString()),
                                    icon: const Icon(Icons.phone),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Materials You Teach",
                          style: TextStyle(color: Colors.black54, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: teacher.grades.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.teal[200]),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context,
                                          MaterialManageMentScreen
                                              .materialManageMentScreenRoute,
                                          arguments: {
                                            "teacher": teacher.name,
                                            "grade": teacher.grades[index]
                                                ["grade"],
                                            "teacherEmail": teacher.email,
                                            "material": teacher.grades[index]
                                                ["material"]
                                          });
                                    },
                                    child: ListTile(
                                      trailing: Text(
                                        "Grade ${teacher.grades[index]["grade"].toString()}",
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 17),
                                      ),
                                      leading: Text(
                                        teacher.grades[index]["material"],
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 17),
                                      ),
                                      // title: Text("-"),
                                    ),
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
