import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(8, 124, 76, 1), // Same background color as your design
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Sign up text
                Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow, // Yellow title color
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),

                // Email TextField
                Text('Email', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300], // Light grey for the input field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Phone Number TextField
                Text('Phone no.', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.phone, // Ensure the keyboard is numeric
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300], // Light grey for the input field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Password TextField
                Text('Password', style: TextStyle(color: Colors.white)),
                SizedBox(height: 6),
                TextField(
                  obscureText: true, // For password input
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300], // Light grey for the input field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Sign up button
                ElevatedButton(
                  onPressed: () {
                    // Handle sign-up logic
                    // After successful sign-up, navigate back to LoginPage
                    Navigator.pop(context); // This will navigate back to the LoginPage
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),

                // Google sign-up button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Google sign-up logic
                  },
                  icon: Image.asset(
                    'assets/google.png', // Replace with your Google icon
                    height: 24,
                    width: 24,
                  ),
                  label: Text('Sign Up with Google'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                SizedBox(height: 10),

                // Apple sign-up button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Apple sign-up logic
                  },
                  icon: Image.asset(
                    'assets/app.jpg', // Replace with your Apple icon
                    height: 24,
                    width: 24,
                  ),
                  label: Text('Sign Up with Apple'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}