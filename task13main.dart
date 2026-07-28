import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'student_details.dart';
import 'edit_course.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Information Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Home Screen
      home: const HomeScreen(),

      // Named Routes
      routes: {
        StudentDetails.routeName: (context) => const StudentDetails(),
        EditCourse.routeName: (context) => const EditCourse(),
      },
    );
  }
}