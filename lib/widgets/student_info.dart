import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  const StudentInfo({super.key});

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
                child: const Text(
                  '7',
                  style: TextStyle(
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
                  "13",
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
                  '22',
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
