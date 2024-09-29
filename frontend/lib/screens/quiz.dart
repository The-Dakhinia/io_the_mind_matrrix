import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

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
  List<String> questions = []; // Store questions here
  List<List<String>> options = []; // Store options here
  List<String> answers = []; // Store correct answers here
  List<String> selectedAnswers = []; // Store selected answers here

  @override
  void initState() {
    super.initState();
    _fetchQuestions(); // Fetch questions when the widget is initialized
  }

  Future<void> _fetchQuestions() async {
    Map<String, String> data = {
      'Subject': widget.subject,
      'Type': widget.type,
      'Topic': widget.chapter,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(response.body); // Decode as Map
        if (result.containsKey('result')) {
          List<dynamic> questionsList = result['result']; // Extract the list of questions

          setState(() {
            questions = questionsList.map((q) => q['question'] as String).toList(); // Extract questions
            options = questionsList.map((q) => List<String>.from(q['options'])).toList(); // Extract options
            answers = questionsList.map((q) => q['answer'] as String).toList(); // Extract correct answers
          });
        } else {
          print('Key "result" not found in the response');
        }
      } else {
        print('Failed to call the API: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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

            // Quiz Questions
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return _buildQuizQuestion(
                    questions[index],
                    options[index],
                    index,
                  );
                },
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _submitQuiz(); // Call the async submit function
              },
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
    Map<String, dynamic> data = {
      'Subject': widget.subject,
      'Type': widget.type,
      'Topic': widget.chapter,
      'Answers': selectedAnswers, // Sending selected answers if needed
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
          print('Python Code Result: ${result['result']}');
        } else {
          print('Key "result" not found in the response');
        }
      } else {
        print('Failed to call the API: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    // Compare selected answers with the correct answers
    _showResultsDialog(context); // Show results dialog after API call
  }

  void _showResultsDialog(BuildContext context) {
    int score = 0;
    StringBuffer resultMessage = StringBuffer('Results:\n');

    for (int i = 0; i < questions.length; i++) {
      if (i < selectedAnswers.length) {
        if (selectedAnswers[i] == answers[i]) {
          score++;
          resultMessage.write('Q${i + 1}: Correct\n');
        } else {
          resultMessage.write('Q${i + 1}: Incorrect (Correct: ${answers[i]})\n');
        }
      }
    }

    resultMessage.write('Score: $score/${questions.length}');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Quiz Results"),
          content: Text(resultMessage.toString()),
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
