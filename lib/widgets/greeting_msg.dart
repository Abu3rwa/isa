import 'package:flutter/material.dart';
import 'package:homeschooler/widgets/student_info.dart';

class GreetingMsg extends StatelessWidget {
  const GreetingMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      height: 200,
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
              const StudentInfo()
            ],
          ),
          const Text(
            'Ahmed Khalid',
            style: TextStyle(
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
