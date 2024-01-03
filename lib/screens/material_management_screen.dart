import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeschooler/utils/theme.dart';
import 'package:homeschooler/widgets/appbar.dart';

class MaterialManageMentScreen extends StatefulWidget {
  static const materialManageMentScreenRoute = "/materialManageMentScreenRoute";

  const MaterialManageMentScreen({super.key});

  @override
  State<MaterialManageMentScreen> createState() =>
      _MaterialManageMentScreenState();
}

class _MaterialManageMentScreenState extends State<MaterialManageMentScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan[800],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.cyan[800],
              child: const Image(
                image: AssetImage("assets/images/school-logo.png"),
              ),
            ),
            const Text("ISA School"),
          ],
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('materials')
            .where('name', isEqualTo: 'English Language')
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
            return Text('No document found with name: name');
          }

          final document = snapshot.data!.docs.first;
          final material = document.data() as Map<String, dynamic>;
          print(document);
          Timestamp time = material["quizzes"]["trueFalse"]["dueDate"];
          final date =
              DateTime.fromMillisecondsSinceEpoch(time.microsecondsSinceEpoch);
          String formattedDate =
              DateFormat('MMM dd yyyy').format(time.toDate()); // "2022-08-25"

          print(material["quizzes"]["trueFalse"]["questions"]);
          // Access the fields of the document
          // final documentName = data['name'] as String;
          // final documentField1 = data['quizzes'] as String;
          // final documentField2 = data['others'] as int;

          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: MyAppTheme.mainBg,
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          material['name'],
                          style: TextStyle(
                              color: MyAppTheme.mainTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Grade ${material["grade"]}",
                          style: TextStyle(
                              color: MyAppTheme.mainTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          color: MyAppTheme.primaryBg,
                          padding: EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Text(
                                      style: TextStyle(
                                        color: MyAppTheme.white,
                                        fontSize: 12,
                                      ),
                                      "Assignments"),
                                  color: MyAppTheme.primaryBg,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Text(
                                      style: TextStyle(
                                        color: MyAppTheme.mainTextColor,
                                        fontSize: 13,
                                      ),
                                      "quizzes"),
                                  color: MyAppTheme.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Text(
                                      style: TextStyle(
                                        color: MyAppTheme.mainTextColor,
                                        fontSize: 13,
                                      ),
                                      "Others"),
                                  color: MyAppTheme.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.teal[200]),
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border(
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
                                            style: TextStyle(
                                              color: MyAppTheme.primaryBg,
                                              fontSize: 14,
                                            ),
                                            "New Assignments"),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: material["quizzes"]["trueFalse"]
                                          ["questions"]
                                      .map<Widget>((q) {
                                    print(q["questionText"]);
                                    return ListTile(
                                      title: Text(material["quizzes"]
                                          ["trueFalse"]["instructions"]),
                                      subtitle:
                                          Text("Due Date: ${formattedDate}"),
                                      trailing: IconButton(
                                        // style: ButtonStyle(
                                        //     backgroundColor:
                                        //         MaterialStatePropertyAll(
                                        //             MyAppTheme.primaryBg)),
                                        icon: Icon(
                                          Icons.edit,
                                          size: 30,
                                          color: MyAppTheme.primaryBg,
                                        ),
                                        onPressed: () {},
                                      ),
                                    );
                                  }).toList(),
                                )

                                // Container(
                                //   height:
                                //       MediaQuery.of(context).size.height - 150,
                                //   child: ListView.builder(
                                //       itemCount: 9,
                                //       itemBuilder: (context, index) {
                                //         return Container(
                                //           color: MyAppTheme.secondaryGreyBg,
                                //           margin: EdgeInsets.all(5),
                                //           child: ListTile(
                                //             title: Text(material["quizzes"]
                                //                 ["trueFalse"]["instructions"]),
                                //             subtitle: Text(
                                //                 "Due Date: ${formattedDate}"),
                                //             trailing: IconButton(
                                //               // style: ButtonStyle(
                                //               //     backgroundColor:
                                //               //         MaterialStatePropertyAll(
                                //               //             MyAppTheme.primaryBg)),
                                //               icon: Icon(
                                //                 Icons.edit,
                                //                 size: 30,
                                //                 color: MyAppTheme.primaryBg,
                                //               ),
                                //               onPressed: () {},
                                //             ),
                                //           ),
                                //         );
                                //       }),
                                // ),
                              ],
                            )
                          ],
                        ))
                      ],
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
