import 'package:flutter/material.dart';

class MaterialDetailsScreen extends StatelessWidget {
  static const materialDetailsScreenRoute = "/materialDetailsScreenRoute";

  const MaterialDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text('English G7'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Course Materials 1'),
            subtitle: const Text('Uploaded on 2021-08-15'),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.file_download,
                  color: Colors.teal,
                )),
            onTap: () {
              // Handle tap on course materials 1
              // Open/download the file, navigate to details, etc.
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Course Materials 2'),
            subtitle: const Text('Uploaded on 2021-08-20'),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.file_download,
                  color: Colors.teal,
                )),
            onTap: () {
              // Handle tap on course materials 2
              // Open/download the file, navigate to details, etc.
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Assignment 1'),
            subtitle: const Text('Due on 2021-09-01'),
            trailing: IconButton(
              icon: const Icon(Icons.file_upload, color: Colors.deepOrange),
              onPressed: () {},
            ),
            onTap: () {
              // Handle tap on assignment 1
              // Submit the assignment, navigate to details, etc.
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Assignment 2'),
            subtitle: const Text('Due on 2021-09-10'),
            trailing: IconButton(
              icon: const Icon(Icons.file_upload, color: Colors.deepOrange),
              onPressed: () {},
            ),
            onTap: () {
              // Handle tap on assignment 2
              // Submit the assignment, navigate to details, etc.
            },
          ),
          // Add more list tiles for other related materials
        ],
      ),
    );
  }
}
