import 'package:flutter/material.dart';
import 'package:tutorgenie/screens/chapter.dart';
// import 'ch'; // Import the chapter page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String profileImageUrl = 'https://img.freepik.com/premium-vector/cute-boy-smiling-cartoon-kawaii-boy-illustration-boy-avatar-happy-kid_1001605-3447.jpg'; // Default boy avatar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Color.fromRGBO(8, 124, 76, 1),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User greeting with profile image
              Row(
                children: [
                  GestureDetector(
                    onTap: _chooseAvatar, // Show avatar selection dialog
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profileImageUrl),
                      radius: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Hi Swastik',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Modules section
              Text(
                'Modules:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Science', type: 'Module'),
                        ),
                      );
                    },
                    child: _buildCard('Science', 'https://static.vecteezy.com/ti/photos-gratuite/t2/22006652-science-contexte-illustration-scientifique-conception-flacons-verre-et-chimie-la-physique-elements-generatif-ai-photo.jpeg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Geography', type: 'Module'),
                        ),
                      );
                    },
                    child: _buildCard('Geography', 'https://st.depositphotos.com/1000123/4558/i/450/depositphotos_45588955-stock-photo-vacation-and-travel-backgrounds.jpg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Mathematics', type: 'Module'),
                        ),
                      );
                    },
                    child: _buildCard('Mathematics', 'https://www.wachesehacademy.com/wp-content/uploads/2021/08/mathematics-circular-flat-vector-20232263.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Quizzes section
              Text(
                'Quizzes:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Science', type: 'Quiz'),
                        ),
                      );
                    },
                    child: _buildCard('Science Quiz', 'https://static.vecteezy.com/ti/photos-gratuite/t2/22006652-science-contexte-illustration-scientifique-conception-flacons-verre-et-chimie-la-physique-elements-generatif-ai-photo.jpeg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Geography', type: 'Quiz'),
                        ),
                      );
                    },
                    child: _buildCard('Geography Quiz', 'https://st.depositphotos.com/1000123/4558/i/450/depositphotos_45588955-stock-photo-vacation-and-travel-backgrounds.jpg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Mathematics', type: 'Quiz'),
                        ),
                      );
                    },
                    child: _buildCard('Mathematics Quiz', 'https://www.wachesehacademy.com/wp-content/uploads/2021/08/mathematics-circular-flat-vector-20232263.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Exercises section
              Text(
                'Exercises:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Science', type: 'Exercise'),
                        ),
                      );
                    },
                    child: _buildCard('Science Exercise', 'https://static.vecteezy.com/ti/photos-gratuite/t2/22006652-science-contexte-illustration-scientifique-conception-flacons-verre-et-chimie-la-physique-elements-generatif-ai-photo.jpeg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Geography', type: 'Exercise'),
                        ),
                      );
                    },
                    child: _buildCard('Geography Exercise', 'https://st.depositphotos.com/1000123/4558/i/450/depositphotos_45588955-stock-photo-vacation-and-travel-backgrounds.jpg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(subject: 'Mathematics', type: 'Exercise'),
                        ),
                      );
                    },
                    child: _buildCard('Mathematics Exercise', 'https://www.wachesehacademy.com/wp-content/uploads/2021/08/mathematics-circular-flat-vector-20232263.jpg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String imageUrl) {
    return Container(
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            height: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _chooseAvatar() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose Your Avatar"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        profileImageUrl = 'https://img.freepik.com/premium-vector/cute-boy-smiling-cartoon-kawaii-boy-illustration-boy-avatar-happy-kid_1001605-3447.jpg'; // Boy Avatar
                      });
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage('https://img.freepik.com/premium-vector/cute-boy-smiling-cartoon-kawaii-boy-illustration-boy-avatar-happy-kid_1001605-3447.jpg'),
                          radius: 30,
                        ),
                        SizedBox(width: 10),
                        Text('Boy Avatar'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        profileImageUrl = 'https://static.vecteezy.com/system/resources/thumbnails/029/796/026/small_2x/asian-girl-anime-avatar-ai-art-photo.jpg'; // Girl Avatar
                      });
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/029/796/026/small_2x/asian-girl-anime-avatar-ai-art-photo.jpg'),
                          radius: 30,
                        ),
                        SizedBox(width: 10),
                        Text('Girl Avatar'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          },
        );
    }
}