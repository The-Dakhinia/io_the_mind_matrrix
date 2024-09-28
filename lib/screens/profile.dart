import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(8, 124, 76, 1),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle, color: Colors.yellow, size: 50),
                      SizedBox(width: 10),
                      Text(
                        'Welcome !!',
                        style: TextStyle(color: Colors.yellow, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Let's get started with your learning profile..",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 20),

                  // Class dropdown
                  Text('Class', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: ['1', '2', '3', '4', '5', '6'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),

                  // Subject and Marks inputs
                  for (var i = 1; i <= 6; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sub$i', style: TextStyle(color: Colors.white)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  hintText: 'Subject Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  hintText: 'Marks',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),

                  // Total Percentage input
                  Text('Total Percentage', style: TextStyle(color: Colors.white)),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: 'Enter your total percentage',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),

                  // Save and Next buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle save action
                        },
                        child: Text('SAVE'),
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle next action (possibly navigate to another screen)
                        },
                        child: Text('NEXT'),
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                      ),
                    ],
                  ),
                ],
              ),
            )
            ),
        );
    }
}