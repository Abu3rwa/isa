import 'package:flutter/material.dart';

class SetUserRole extends StatelessWidget {
  const SetUserRole({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: const Column(children: [
        Image(
          image: AssetImage("assets/images/school-logo.png"),
          height: 200,
          width: 200,
        ),
        Text(" Welcome to ISA School")
      ]),
    );
  }
}
