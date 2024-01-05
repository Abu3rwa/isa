import 'package:flutter/material.dart';
import 'package:homeschooler/utils/theme.dart';

class ListOfQuizzes extends StatelessWidget {
  const ListOfQuizzes({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map<Widget>(
            (quiz) => Card(
              elevation: 0.5,
              shadowColor: Colors.cyan,
              margin: const EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(
                  Icons.question_mark,
                  size: 40,
                  color: Colors.cyan[800],
                ),
                title: Text(
                  quiz["instructions"],
                  style:
                      TextStyle(fontSize: 16, color: MyAppTheme.darkTextColor),
                ),
                subtitle: Text(
                  'Due Date: 8-1-2024',
                  style: TextStyle(fontSize: 13, color: MyAppTheme.secondaryBg),
                ),
                onTap: () {
                  // Handle tap on course materials 2
                  // Open/download the file, navigate to details, etc.
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
