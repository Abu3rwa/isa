import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final screenTitle;
  MyAppBar({super.key, this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.teal[50],
          child: const Image(
            image: AssetImage("assets/images/school-logo.png"),
          ),
        ),
        const Text("ISA School"),
      ],
    );
  }
}
