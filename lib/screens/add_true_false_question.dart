import 'package:flutter/material.dart';
import '../services/quiz_service.dart';
import '../utils/theme.dart';

class AddTrueFalseQuestion extends StatefulWidget {
  static const addTrueFalseQuestionRoute = "/addTrueFalseQuestionRoute";
  const AddTrueFalseQuestion();
  @override
  _AddTrueFalseQuestionState createState() => _AddTrueFalseQuestionState();
}

class _AddTrueFalseQuestionState extends State<AddTrueFalseQuestion> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  bool questionAnswer = true;
  var questions = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final quiz = {
      "teacher": args["teacher"],
      "questions": questions,
      "grade": args["grade"],
      "teacherEmail": args["teacherEmail"],
      "material": args["material"],
      "typeOfQuestion": "true/false"
    };
    print("KKKKKK: ${quiz}");
    ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppTheme.primaryBg,
        elevation: 0,
        centerTitle: true,
        title: const Text("ISA School"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Title: eg. the name of the topics included',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: TextField(
                    controller: _instructionsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Instructions',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: TextField(
                    controller: _notesController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Notes"),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: TextField(
                    controller: _dueDateController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Due Date"),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan[700]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextField(
                          controller: _questionController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Question Text"),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          'Answer:',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "this is the correct answer for your question",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: questionAnswer,
                            onChanged: (value) {
                              setState(() {
                                questionAnswer = value as bool;
                              });
                            },
                            fillColor: const MaterialStatePropertyAll(
                                Colors.amberAccent),
                          ),
                          const Text(
                            'True',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 16.0),
                          Radio(
                              value: false,
                              groupValue: questionAnswer,
                              onChanged: (value) {
                                setState(() {
                                  questionAnswer = value as bool;
                                });
                              },
                              fillColor: const MaterialStatePropertyAll(
                                  Colors.amberAccent)),
                          const Text(
                            'False',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                questions.length > 0
                    ? Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "You Added: ",
                              style: TextStyle(
                                fontSize: 17,
                                color: MyAppTheme.lightTextColor,
                              )),
                          TextSpan(
                              text: questions.length.toString(),
                              style: TextStyle(
                                  color: MyAppTheme.primaryBg,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: " Questions",
                              style: TextStyle(
                                fontSize: 17,
                                color: MyAppTheme.lightTextColor,
                              ))
                        ]),
                      )
                    : const Text(
                        "you didn't add any questions",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          addQuestion();
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                        label: const Text('Add'),
                        style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.teal),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white))),
                    ElevatedButton(
                      style: const ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(Colors.red),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print({
                          "questions": questions,
                          "instructions": _instructionsController.text,
                          "note": _notesController.text,
                          "teacher": args["name"],
                          "grade": args["grade"],
                          "teacherEmail": args["teacherEmail"],
                          "material": args["material"],
                          "title": _titleController.text,
                          'dateDate': _dueDateController.text,
                          "type": "true/false"
                        });
                        QuizService().addTrueFalseQuiz(
                            dueDate: _dueDateController.text,
                            title: _titleController.text,
                            questions: questions,
                            instructions: _instructionsController.text,
                            dateDate: _dueDateController.text,
                            note: _notesController.text,
                            teacher: args["teacher"],
                            grade: args["grade"],
                            teacherEmail: args["teacherEmail"],
                            material: args["material"],
                            type: "true/false");
                      },
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addQuestion() {
    questions.add(
        {"questionText": _questionController.text, "answer": questionAnswer});
    setState(() {});
  }
}
