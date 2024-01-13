import 'package:flutter/material.dart';
import 'package:homeschooler/services/studentService.dart';
import 'package:homeschooler/widgets/student_info.dart';
import 'package:provider/provider.dart';

class StudentInformation extends StatelessWidget {
  const StudentInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<StudentService>(context, listen: false).student;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 3 - 50,
      decoration: BoxDecoration(
          color: Colors.cyan[800],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(100), // Adjust the radius as needed

                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"),
                ),
              ),
              Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                border: TableBorder.all(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(8)),
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
              )
            ],
          ),
          Text(
            student.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
