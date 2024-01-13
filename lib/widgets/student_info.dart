import 'package:flutter/material.dart';
import 'package:homeschooler/models/studentModel.dart';

class StudentInfo extends StatelessWidget {
  StudentModel student;
  StudentInfo({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      border: TableBorder.all(
          color: Colors.tealAccent, borderRadius: BorderRadius.circular(8)),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Grade",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  student.grade.toString(),
                  style: const TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),

        TableRow(
          children: [
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Age",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  student.age.toString(),
                  style: const TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Add more rows as needed
        TableRow(
          children: [
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Attendance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  '97%',
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Add more rows as needed
        TableRow(
          children: [
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Level',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'v.good',
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Add more rows as needed
      ],
    );
  }
}
