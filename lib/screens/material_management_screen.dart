import 'dart:convert';
import 'package:homeschooler/models/quizModel.dart';
import 'package:homeschooler/screens/choose_type_of_question.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../widgets/list_of_quizzes.dart';

class MaterialManageMentScreen extends StatefulWidget {
  static const materialManageMentScreenRoute = "/materialManageMentScreenRoute";

  const MaterialManageMentScreen({super.key});

  @override
  State<MaterialManageMentScreen> createState() =>
      _MaterialManageMentScreenState();
}

class _MaterialManageMentScreenState extends State<MaterialManageMentScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan[800],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.cyan[800],
              child: const Image(
                image: AssetImage("assets/images/school-logo.png"),
              ),
            ),
            Text("materials"),
          ],
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('quizzes')
            .where('material', isEqualTo: args["material"])
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.hasError);
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.cyan,
            ));
          }

          if (snapshot.data!.docs.isEmpty) {
            print('No document found with name: name');
            return Center(
                child: const Text('No document found with name: name'));
          }

          final documents = snapshot.data!.docs as List;

          List list = [];
          List quizzes = documents.toList();
          quizzes.forEach((quiz) {
            list.add(quiz.data());
          });
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: MyAppTheme.mainBg,
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          args["material"],
                          style: TextStyle(
                              color: MyAppTheme.mainTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Grade ${args['grade']}",
                          style: TextStyle(
                              color: MyAppTheme.mainTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Column(children: quizzes.map<Widget>((value.data()) => ListTile() ).toList(),)
                    Column(
                      children: [
                        Container(
                          color: MyAppTheme.primaryBg,
                          padding: EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Text(
                                    "quizzes.material",
                                    style: TextStyle(
                                      color: MyAppTheme.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  color: MyAppTheme.primaryBg,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Text(
                                    "quizzes",
                                    style: TextStyle(
                                      color: MyAppTheme.mainTextColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                  color: MyAppTheme.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Text(
                                    "Others",
                                    style: TextStyle(
                                      color: MyAppTheme.mainTextColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                  color: MyAppTheme.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.teal[200]),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context,
                                        ChooseTypeOfQuestionScreen
                                            .chooseTypeOfQuestionScreen,
                                        arguments: args);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.teal,
                                            width: 2,
                                          ),
                                          top: BorderSide(
                                            color: Colors.teal,
                                            width: 2,
                                          ),
                                          right: BorderSide(
                                            color: Colors.teal,
                                            width: 2,
                                          ),
                                          left: BorderSide(
                                            color: Colors.teal,
                                            width: 2,
                                          ),
                                        )),
                                    child: Text(
                                      "New Assignments",
                                      style: TextStyle(
                                        color: MyAppTheme.primaryBg,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ListOfQuizzes(list: list)
                          ],
                        )
                      ],
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
