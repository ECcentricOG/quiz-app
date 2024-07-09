import 'package:flutter/material.dart';
import 'quiz_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const QuizApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
