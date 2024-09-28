import 'package:flutter/material.dart';
import 'package:tutorgenie/screens/login_page.dart';
// import 'login_page.dart'; // Import LoginPage

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(8, 124, 76, 1),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Unlock your potential\nwith AI-powered learning.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'TUTORGENIE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/tutor.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (context) => LoginPage()),
                      MaterialPageRoute(builder: (context) => LoginPage())
                    );
                  },
                  style: ElevatedButton.styleFrom(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
        ),
    );
  }
}