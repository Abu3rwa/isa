import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeschooler/models/quiz_model.dart';
import 'package:homeschooler/models/user_model.dart';
import 'package:homeschooler/screens/material_management_screen.dart';
import 'package:homeschooler/utils/theme.dart';
import 'package:homeschooler/widgets/appbar.dart';

class TrueFalseQuizScreen extends StatelessWidget {
  static const trueFalseQuizScreenRoute = "/trueFalseQuizScreenRoute";
  TrueFalseQuizScreen({super.key});
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as QuizModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        elevation: 0,
        title: MyAppBar(),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: MyAppTheme.mainBg,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(
                //   height: 20,
                // ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: MyAppTheme.primaryBg,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${quiz.material.toUpperCase()} QUIZ",
                        style: TextStyle(
                            color: MyAppTheme.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "GRADE: ${quiz.grade}",
                            style: const TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Due Date: ${quiz.dueDate}",
                            style: const TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "*NOTE: ",
                              style: TextStyle(
                                fontSize: 20,
                                color: MyAppTheme.secondaryBg,
                              )),
                          TextSpan(
                              text: quiz.note,
                              style: TextStyle(
                                  color: MyAppTheme.lightTextColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        quiz.instructions,
                        style: TextStyle(
                            color: MyAppTheme.primaryBg,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'The Questions',
                        style: TextStyle(
                            color: MyAppTheme.darkTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: quiz.questions
                            .map<Widget>((
                              q,
                            ) =>
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Icon(
                                            size: 40,
                                            color: Colors.green,
                                            Icons.done,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "${quiz.questions.indexOf(q) + 1}.  ",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          MyAppTheme.primaryBg,
                                                    )),
                                                TextSpan(
                                                    text: q["questionText"],
                                                    style: TextStyle(
                                                        color: MyAppTheme
                                                            .lightTextColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        ElevatedButton(
                                                            style: const ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .green),
                                                                foregroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .white)),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                "True")),
                                                        ElevatedButton(
                                                            style: const ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .red),
                                                                foregroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .white)),
                                                            onPressed: () {},
                                                            child:
                                                                Text("False"))
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
