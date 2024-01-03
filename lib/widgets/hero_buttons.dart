import 'package:flutter/material.dart';
import '../screens/materials-screen.dart';

class HeroButtons extends StatelessWidget {
  const HeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 200,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 10,
            children: [
              CustomedCard(
                fun: () {
                  Navigator.pushNamed(
                      context, MaterialsScreen.materialsScreenRoute);
                },
                icon: Icons.alarm,
                title: "TimeTable",
              ),
              CustomedCard(
                fun: () {
                  Navigator.pushNamed(
                      context, MaterialsScreen.materialsScreenRoute);
                },
                icon: Icons.book,
                title: "Materials",
              ),
              CustomedCard(
                fun: () {
                  Navigator.pushNamed(
                      context, MaterialsScreen.materialsScreenRoute);
                },
                icon: Icons.assignment,
                title: "Assignments",
              ),
              CustomedCard(
                fun: () {
                  // Navigator.pushNamed(
                  //     context, AssigmentsScreen.assigmentsScreenRoute);
                },
                icon: Icons.celebration,
                title: "Exam Results",
              ),
              CustomedCard(
                fun: () {
                  Navigator.pushNamed(
                      context, MaterialsScreen.materialsScreenRoute);
                },
                icon: Icons.self_improvement,
                title: "Progress",
              ),
              CustomedCard(
                fun: () {
                  Navigator.pushNamed(
                      context, MaterialsScreen.materialsScreenRoute);
                },
                icon: Icons.date_range,
                title: "Calendar",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomedCard extends StatelessWidget {
  var icon;
  var title;
  var fun;
  CustomedCard({super.key, this.title, this.icon, this.fun});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          // color: Colors.white,
          // color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll<double?>(1.0),
            overlayColor: MaterialStatePropertyAll(Colors.cyan.shade100),
            backgroundColor: const MaterialStatePropertyAll(Colors.white)),
        onPressed: fun,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Icon(
                icon,
                size: 70,
                color: Colors.cyan,
              )
            ],
          ),
        ),
      ),
    );
  }
}
