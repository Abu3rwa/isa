import 'package:flutter/material.dart';
import '/screens/add_true_false_question.dart';
import '/utils/theme.dart';

class ChooseTypeOfQuestionScreen extends StatefulWidget {
  static const chooseTypeOfQuestionScreen = "/chooseTypeOfQuestionScreen";
  const ChooseTypeOfQuestionScreen({super.key});

  @override
  State<ChooseTypeOfQuestionScreen> createState() =>
      _ChooseTypeOfQuestionScreenState();
}

class _ChooseTypeOfQuestionScreenState
    extends State<ChooseTypeOfQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppTheme.primaryBg,
        elevation: 0,
        centerTitle: true,
        title: const Text("ISA School"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: MyAppTheme.mainBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Choose a type of Question',
              style: TextStyle(
                color: MyAppTheme.mainTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyAppTheme.primaryBg,
              ),
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: MaterialButton(
                elevation: 0,
                onPressed: () {
                  Navigator.pushNamed(
                      context, AddTrueFalseQuestion.addTrueFalseQuestionRoute,
                      arguments: {
                        "teacher": args["teacher"],
                        "grade": args["grade"],
                        "teacherEmail": args["teacherEmail"],
                        "material": args["material"],
                        "typeOfQuestion": "true/false"
                      });
                },
                child: Text(
                    style: TextStyle(
                      color: MyAppTheme.white,
                      fontSize: 17,
                    ),
                    "Choose True or False"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyAppTheme.primaryBg,
              ),
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: MaterialButton(
                elevation: 0,
                onPressed: () {},
                child: Text(
                    style: TextStyle(
                      color: MyAppTheme.white,
                      fontSize: 17,
                    ),
                    "Choose the correct Answers"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyAppTheme.primaryBg,
              ),
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: MaterialButton(
                elevation: 0,
                onPressed: () {},
                child: Text(
                    style: TextStyle(
                      color: MyAppTheme.white,
                      fontSize: 17,
                    ),
                    "Writing: Articles, Paragraph, etc"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyAppTheme.primaryBg,
              ),
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: MaterialButton(
                elevation: 0,
                onPressed: () {},
                child: Text(
                    style: TextStyle(
                      color: MyAppTheme.white,
                      fontSize: 17,
                    ),
                    "Type the missing Word"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
