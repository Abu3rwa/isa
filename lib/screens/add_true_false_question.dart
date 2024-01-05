import 'package:flutter/material.dart';
import '../services/quiz_service.dart';
import '../utils/theme.dart';

class AddTrueFalseQuestion extends StatefulWidget {
  static const addTrueFalseQuestionRoute = "/addTrueFalseQuestionRoute";

  @override
  _AddTrueFalseQuestionState createState() => _AddTrueFalseQuestionState();
}

class _AddTrueFalseQuestionState extends State<AddTrueFalseQuestion> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  bool questionAnswer = true;
  var questions = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final quiz = {
      "teacher": args["name"],
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: TextField(
                    controller: _instructionsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'instructions',
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
                    controller: _notesController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Notes"),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: TextField(
                    controller: _questionController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Question"),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan[700]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        QuizService().addTrueFalseQuiz(
                            questions: questions,
                            instructions: _instructionsController.text,
                            type: _typeController.text,
                            note: _notesController.text,
                            teacher: args["name"],
                            grade: args["grade"],
                            teacherEmail: args["teacherEmail"],
                            material: args["material"],
                            typeOfQuestion: "true/false");
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
  }
}
