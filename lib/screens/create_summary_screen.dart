import 'package:flutter/material.dart';

import '../utils/theme.dart';

class CreateSummaryScreen extends StatefulWidget {
  static const createSummaryScreenRoute = "/createSummaryScreenRoute";
  CreateSummaryScreen({super.key});
  @override
  _CreateSummaryScreenState createState() => _CreateSummaryScreenState();
}

class _CreateSummaryScreenState extends State<CreateSummaryScreen> {
  final TextEditingController _questionController = TextEditingController();
  // final TextEditingController _instructionsController = TextEditingController();
  // final TextEditingController _notesController = TextEditingController();
  // final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _headingController = TextEditingController();
  final TextEditingController _subheadingController = TextEditingController();
  bool questionAnswer = true;
  var paragraphs = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final quiz = {};

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
                    controller: _headingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Heading of your summary',
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
                    controller: _subheadingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'subheading',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
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
                        // height: 200,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextField(
                          controller: _questionController,
                          maxLines: 13,
                          minLines: 5,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Paragraph Text"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                paragraphs.isNotEmpty
                    ? Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "You Added: ",
                              style: TextStyle(
                                fontSize: 17,
                                color: MyAppTheme.lightTextColor,
                              )),
                          TextSpan(
                              text: paragraphs.length.toString(),
                              style: TextStyle(
                                  color: MyAppTheme.primaryBg,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: " paragraph",
                              style: TextStyle(
                                fontSize: 17,
                                color: MyAppTheme.lightTextColor,
                              ))
                        ]),
                      )
                    : const Text(
                        "you didn't add any paragraph",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          addParagraph();
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
                      onPressed: () {},
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

  addParagraph() {
    paragraphs.add(
        {"questionText": _questionController.text, "answer": questionAnswer});
    setState(() {});
  }
}
