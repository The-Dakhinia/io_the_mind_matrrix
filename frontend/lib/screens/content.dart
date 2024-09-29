import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  final String chapter;

  ContentPage({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(chapter),
          backgroundColor: Color.fromRGBO(8, 124, 76, 1),
        ),
        body: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
            style: TextStyle(fontSize: 24),
            ),
        );
    }
}