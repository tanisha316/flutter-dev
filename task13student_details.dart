import 'package:flutter/material.dart';
import 'edit_course.dart';

class StudentDetails extends StatefulWidget {
  static const String routeName = "/studentDetails";

  final String studentName;
  final String rollNumber;
  final String course;

  const StudentDetails({
    super.key,
    this.studentName = "",
    this.rollNumber = "",
    this.course = "",
  });

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  late String currentCourse;

  @override
  void initState() {
    super.initState();
    currentCourse = widget.course;
  }

  Future<void> editCourse() async {
    final result = await Navigator.pushNamed(
      context,
      EditCourse.routeName,
      arguments: currentCourse,
    );

    if (result != null && result is String) {
      setState(() {
        currentCourse = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Icon(
                      Icons.school,
                      size: 70,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 20),

                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Name"),
                      subtitle: Text(widget.studentName),
                    ),

                    ListTile(
                      leading: const Icon(Icons.badge),
                      title: const Text("Roll Number"),
                      subtitle: Text(widget.rollNumber),
                    ),

                    ListTile(
                      leading: const Icon(Icons.menu_book),
                      title: const Text("Course"),
                      subtitle: Text(
                        currentCourse,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text("Edit Course"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: editCourse,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context, currentCourse);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}