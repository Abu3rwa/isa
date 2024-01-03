 import 'package:flutter/material.dart';

class StudentAddmissionRequest extends StatelessWidget {
  const StudentAddmissionRequest({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('Student App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button pressed
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button pressed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Emergency Contact',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Parent\'s Name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Parent\'s Contact',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'School or College',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Grade or Year of Study',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Relevant Academic Achievements',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Skills',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Interests',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'High Grades',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Awards',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform the addmission process
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
 
  }
}