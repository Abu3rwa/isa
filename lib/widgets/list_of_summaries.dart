import 'package:flutter/material.dart';
import 'package:homeschooler/screens/create_summary_screen.dart';
import 'package:homeschooler/utils/theme.dart';

class ListOfSummaries extends StatefulWidget {
  const ListOfSummaries({
    super.key,
    required this.summariesList,
    required this.args,
  });

  final List summariesList;
  final Map args;
  @override
  State<ListOfSummaries> createState() => _ListOfSummariesState();
}

class _ListOfSummariesState extends State<ListOfSummaries> {
  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(
                    context, CreateSummaryScreen.createSummaryScreenRoute,
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
                  "New Summary",
                  style: TextStyle(
                    color: MyAppTheme.primaryBg,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Card(
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
                  "title",
                  style: TextStyle(
                    fontSize: 16,
                    color: MyAppTheme.darkTextColor,
                  ),
                ),
                subtitle: Text(
                  'Due Date: 8-1-2024',
                  style:
                      TextStyle(fontSize: 13, color: MyAppTheme.lightTextColor),
                ),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, CreateSummaryScreen.createSummaryScreenRoute);
                  // Handle tap on course materials 2
                  // Open/download the file, navigate to details, etc.
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
