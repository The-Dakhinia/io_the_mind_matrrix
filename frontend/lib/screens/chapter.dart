import 'package:flutter/material.dart';
// import 'package:tutorgenie/exercise.dart';
import 'package:tutorgenie/screens/content.dart';
import 'package:tutorgenie/screens/exercise.dart';
import 'package:tutorgenie/screens/quiz.dart';
// import 'content_page.dart'; // Import the page to show the content
// import 'quiz_page.dart'; // Import the quiz page

class ChapterPage extends StatelessWidget {
  final String subject; // The subject name passed from the previous page
  final String type; // To differentiate between module and quiz

  ChapterPage({required this.subject, required this.type});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> chapters = _getChaptersForSubject(subject);

    return Scaffold(
      appBar: AppBar(
        title: Text("$subject Chapters"),
        backgroundColor: Color.fromRGBO(8, 124, 76, 1),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sub Modules:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Check type and navigate accordingly
                      if (type == 'Quiz') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              chapter: chapters[index]['name']!,
                              subject: subject,
                              type: type,
                            ),
                          ),
                        );
                      } else if (type == 'Exercise') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                                chapter: chapters[index]['name']!
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContentPage(
                              chapter: chapters[index]['name']!,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(chapters[index]['imageUrl']!),
                                radius: 30,
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 210,
                                child: Text(
                                  chapters[index]['name']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> _getChaptersForSubject(String subject) {
    switch (subject) {
      case 'Science':
        return [
          {
            'name': 'Crop Production and Management',
            'imageUrl': 'https://images.collegedunia.com/public/image/5080019f73cd9a0678351bdbd976d435.png'
          },
          {
            'name': 'Microorganisms: Friend and Foe',
            'imageUrl': 'https://i.pinimg.com/originals/d5/4e/5f/d54e5f63c5c2dcd831bae5f30d5e53bc.png'
          },
          {
            'name': 'Synthetic Fibres and Plastics',
            'imageUrl': 'https://science.olympiadsuccess.com/assets/images/science_square/science_topic_54.jpg'
          },
          {
            'name': 'Combustion and Flame',
            'imageUrl': 'https://image.slidesharecdn.com/combustionandflame-110118075811-phpapp02/85/Combustion-and-flame-1-320.jpg'
          },
        ];
      case 'Geography':
        return [
          {
            'name': 'Landforms and Landscapes',
            'imageUrl': 'https://mgscyear8geography.weebly.com/uploads/4/8/6/0/48602587/6966140.jpg?383'
          },
          {
            'name': 'Weather and Climate',
            'imageUrl': 'https://cdn.slidesharecdn.com/ss_thumbnails/weatherandclimate-180629101736-thumbnail.jpg?width=640&height=640&fit=bounds'
          },
        ];
      case 'Mathematics':
        return [
          {
            'name': 'Algebra',
            'imageUrl': 'https://static.vecteezy.com/system/resources/thumbnails/005/676/797/small/maths-symbols-icon-set-algebra-or-mathematics-subject-doodle-design-education-and-study-concept-back-to-school-background-for-notebook-not-pad-sketchbook-hand-drawn-illustration-vector.jpg'
          },
          {
            'name': 'Geometry',
            'imageUrl': 'https://t3.ftcdn.net/jpg/03/66/39/30/360_F_366393058_zniuIqgkVTfnoL7eqTshVYpwi9yhJVU8.jpg'
          },
        ];
      default:
        return [];
    }
  }
}
