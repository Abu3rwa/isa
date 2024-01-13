import 'dart:convert';
import 'package:homeschooler/models/quiz_model.dart';
import 'package:homeschooler/screens/choose_type_of_question.dart';
import 'package:homeschooler/widgets/list_of_summaries.dart';
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
  GlobalKey quizzessKey = GlobalKey();
  GlobalKey summariesKey = GlobalKey();
  GlobalKey othersKey = GlobalKey();
  var isActive;
  void initState() {
    super.initState();
    setState(() {
      isActive = quizzessKey;
    });
  }

  final summariesList = [];
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
            .where('grade', isEqualTo: args["grade"])
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

          final documents = snapshot.data!.docs;

          List<QuizModel> quizzesList = [];
          List quizzes = documents.toList();
          quizzes.forEach((quiz) {
            quizzesList.add(QuizModel.fromJson(quiz.data(), quiz));
          });

          return Container(
            height: MediaQuery.of(context).size.height,
            color: MyAppTheme.mainBg,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
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
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  key: quizzessKey,
                                  elevation: 0,
                                  onPressed: () {
                                    setState(() {
                                      isActive = quizzessKey;
                                    });
                                  },
                                  child: Text(
                                    "quizzes",
                                    style: TextStyle(
                                      color: isActive == quizzessKey
                                          ? MyAppTheme.white
                                          : MyAppTheme.primaryBg,
                                      fontSize: 12,
                                    ),
                                  ),
                                  color: isActive == quizzessKey
                                      ? MyAppTheme.primaryBg
                                      : MyAppTheme.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  key: summariesKey,
                                  elevation: 0,
                                  onPressed: () {
                                    setState(() {
                                      isActive = summariesKey;
                                    });
                                  },
                                  child: Text("summaries",
                                      style: TextStyle(
                                        color: isActive == summariesKey
                                            ? MyAppTheme.white
                                            : MyAppTheme.primaryBg,
                                      )),
                                  color: isActive == summariesKey
                                      ? MyAppTheme.primaryBg
                                      : MyAppTheme.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  key: othersKey,
                                  elevation: 0,
                                  onPressed: () {
                                    setState(() {
                                      isActive = othersKey;
                                    });
                                  },
                                  child: Text(
                                    "Others",
                                    style: TextStyle(
                                      color: isActive == othersKey
                                          ? MyAppTheme.white
                                          : MyAppTheme.primaryBg,
                                    ),
                                  ),
                                  color: isActive == othersKey
                                      ? MyAppTheme.primaryBg
                                      : MyAppTheme.white,
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
                            isActive == quizzessKey
                                ? ListOfQuizzes(
                                    quizzesList: quizzesList,
                                    args: args,
                                  )
                                : isActive == summariesKey
                                    ? ListOfSummaries(
                                        summariesList: summariesList,
                                        args: args,
                                      )
                                    : Center(child: Text("not yet"))
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
