import 'package:flutter/material.dart';
import 'package:homeschooler/models/quiz_model.dart';
import 'package:homeschooler/screens/choose_type_of_question.dart';
import 'package:homeschooler/screens/true_false_quiz_screen.dart';
import 'package:homeschooler/services/quiz_service.dart';
import 'package:homeschooler/utils/theme.dart';
import 'package:provider/provider.dart';

class ListOfQuizzes extends StatefulWidget {
  const ListOfQuizzes({
    super.key,
    required this.quizzesList,
    required this.args,
  });

  final List<QuizModel> quizzesList;
  final Map args;

  @override
  State<ListOfQuizzes> createState() => _ListOfQuizzesState();
}

class _ListOfQuizzesState extends State<ListOfQuizzes> {
  @override
  Widget build(BuildContext context) {
    deleteDoc(id) {
      QuizService().deleteQuiz(id);
      widget.quizzesList.removeWhere((element) => element.id == id);
      setState(() {});
      print(widget.quizzesList);
    }

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Quizzes",
              style: TextStyle(
                  fontSize: 17,
                  color: MyAppTheme.primaryBg,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              overlayColor: MaterialStatePropertyAll(Colors.teal[200]),
              onTap: () {
                Navigator.pushNamed(context,
                    ChooseTypeOfQuestionScreen.chooseTypeOfQuestionScreen,
                    arguments: widget.args);
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: const Border(
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
                  "New Quiz",
                  style: TextStyle(
                    color: MyAppTheme.primaryBg,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: widget.quizzesList
              .map<Widget>(
                (quiz) => Card(
                  elevation: 0.5,
                  shadowColor: Colors.cyan,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    // leading: Icon(
                    //   Icons.question_mark,
                    //   size: 40,
                    //   color: Colors.cyan[800],
                    // ),
                    title: Text(
                      quiz.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: MyAppTheme.darkTextColor,
                      ),
                    ),
                    subtitle: Text(
                      'Due Date: 8-1-2024',
                      style: TextStyle(
                          fontSize: 13, color: MyAppTheme.lightTextColor),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // setState(() {
                        deleteDoc(
                          quiz.id,
                        );
                        // });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, TrueFalseQuizScreen.trueFalseQuizScreenRoute,
                          arguments: quiz);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
