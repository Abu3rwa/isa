import 'package:flutter/material.dart';

class MaterialsScreen extends StatelessWidget {
  static const materialsScreenRoute = "/materialsScreenRoute";

  const MaterialsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            'Materials'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(size: 40, color: Colors.cyan[800], Icons.computer),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'Computer Science'),
            subtitle: const Text('Mr. Ahmed'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[800],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "100%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on assignment 2
              // Submit the assignment, navigate to details, etc.
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(size: 40, color: Colors.cyan[800], Icons.map),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'Geography'),
            subtitle: const Text('Mr. Ahmed'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[600],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "80%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on assignment 2
              // Submit the assignment, navigate to details, etc.
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(size: 40, color: Colors.cyan[800], Icons.assignment),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'Science'),
            subtitle: const Text('Mr. Ahmed'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[600],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "70%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on assignment 1
              // Submit the assignment, navigate to details, etc.
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.calculate,
              size: 40,
              color: Colors.cyan[800],
            ),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'maths'),
            subtitle: const Text('Mr. Mohammed'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[500],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "60%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on course materials 2
              // Open/download the file, navigate to details, etc.
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(size: 40, color: Colors.cyan[800], Icons.abc),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'English'),
            subtitle: const Text('Mr. Hussein Zuwawi'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "50%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on course materials 1
              // Open/download the file, navigate to details, etc.
            },
          ),
          ListTile(
            leading: Icon(size: 40, color: Colors.cyan[800], Icons.abc),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'English'),
            subtitle: const Text('Mr. Hussein Zuwawi'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "50%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on course materials 1
              // Open/download the file, navigate to details, etc.
            },
          ),
          ListTile(
            leading: Icon(size: 40, color: Colors.cyan[800], Icons.abc),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'English'),
            subtitle: const Text('Mr. Hussein Zuwawi'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "50%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on course materials 1
              // Open/download the file, navigate to details, etc.
            },
          ),
          ListTile(
            leading: Icon(size: 40, color: Colors.cyan[800], Icons.abc),
            title: const Text(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                'English'),
            subtitle: const Text('Mr. Hussein Zuwawi'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "50%",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              // Handle tap on course materials 1
              // Open/download the file, navigate to details, etc.
            },
          ),
        ],
      ),
    );
  }
}
