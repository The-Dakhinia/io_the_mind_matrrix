

import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final String chapter; // This will hold the chapter name passed from the ChapterPage

  ExercisePage({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercises for $chapter"),
        backgroundColor: Color.fromRGBO(8, 124, 76, 1),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercises:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _buildExerciseList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildExerciseList() {
    // Sample exercises for demonstration. Replace with actual exercise data.
    List<String> exercises = [
      '1. Explain the process of crop production.',
      '2. Discuss the role of microorganisms in agriculture.',
      '3. List the properties of synthetic fibers.',
      '4. Describe the combustion process and its applications.',
    ];

    return exercises.map((exercise) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            exercise,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      );
    }).toList();
  }
}