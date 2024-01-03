import 'package:flutter/material.dart';

class materialsScreen extends StatelessWidget {
  static const materialsScreenRoute = "/materialsScreenRoute";

  const materialsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text('Materials'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text('English'),
            subtitle: const Text('Uploaded on 2021-08-15'),
            onTap: () {
              // Handle tap on course materials 1
              // Open/download the file, navigate to details, etc.
            },
          ),
          // Add more list tiles for other related materials
        ],
      ),
    );
  }
}
