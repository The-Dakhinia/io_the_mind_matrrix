import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizPage extends StatefulWidget {
  final String chapter; // The chapter name passed from the previous page
  final String subject; // The subject name passed from the previous page
  final String type; // The type passed from the previous page

  QuizPage({required this.chapter, required this.subject, required this.type});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final url = Uri.parse('http://192.168.207.224:8000/run-python/');


  List<String> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.chapter} Quiz"),
        backgroundColor: Color.fromRGBO(8, 124, 76, 1),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiz on ${widget.chapter}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Sample quiz questions
            Expanded(
              child: ListView(
                children: [
                  _buildQuizQuestion("1. What is the process of photosynthesis?", [
                    "A. Process by which plants make food",
                    "B. Process of respiration",
                    "C. Process of digestion",
                    "D. None of the above"
                  ], 0),
                  _buildQuizQuestion("2. Which gas do plants absorb?", [
                    "A. Oxygen",
                    "B. Carbon Dioxide",
                    "C. Nitrogen",
                    "D. Hydrogen"
                  ], 1),
                  _buildQuizQuestion("3. What is the main product of photosynthesis?", [
                    "A. Oxygen",
                    "B. Glucose",
                    "C. Water",
                    "D. Carbon Dioxide"
                  ], 2),
                ],
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Submit Quiz"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizQuestion(String question, List<String> options, int questionIndex) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(height: 10),
          ...options.map((option) => _buildOption(option, questionIndex)).toList(),
        ],
      ),
    );
  }

  Widget _buildOption(String option, int questionIndex) {
    return Row(
      children: [
        Radio(
          value: option,
          groupValue: selectedAnswers.length > questionIndex ? selectedAnswers[questionIndex] : null,
          onChanged: (value) {
            setState(() {
              if (selectedAnswers.length <= questionIndex) {
                selectedAnswers.add(value as String);
              } else {
                selectedAnswers[questionIndex] = value as String; // Update existing answer
              }
            });
          },
        ),
        SizedBox(
          width: 200,
          child: Text(
            option,
            style: TextStyle(overflow: TextOverflow.clip),
          ),
        ),
      ],
    );
  }

  Future<void> _submitQuiz() async {
    Map<String, String> data = {
      'Subject': widget.subject,
      'Type': widget.type,
      'Topic': widget.chapter,
      'Answers': jsonEncode(selectedAnswers) // Optional: send selected answers
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result.containsKey('result')) {
          // Print the Python Code Result to the console
          print('Python Code Result: ${result['result']}');
          _showResponseDialog(context, 'Python Code Result: ${result['result']}');
        } else {
          print('Key "result" not found in the response');
          _showResponseDialog(context, 'Key "result" not found in the response');
        }
      } else {
        print('Failed to call the API: ${response.statusCode}');
        _showResponseDialog(context, 'Failed to call the API: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      _showResponseDialog(context, 'Error: $e');
    }
  }

  void _showResponseDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Submission Response"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
