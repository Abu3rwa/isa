import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/materialsScreen.dart';

class HeroButtons extends StatelessWidget {
  const HeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3 +
          MediaQuery.of(context).size.height / 3,

      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 30, bottom: 0),
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
      width: MediaQuery.of(context).size.width / 3 + 20,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Icon(
                icon,
                size: 50,
                color: Colors.cyan,
              )
            ],
          ),
        ),
      ),
    );
  }
}
