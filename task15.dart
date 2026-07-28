import 'package:flutter/material.dart';

void main() {
  runApp(const StudentRegistrationApp());
}

class StudentRegistrationApp extends StatelessWidget {
  const StudentRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Registration',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StudentRegistrationScreen(),
    );
  }
}

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState
    extends State<StudentRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final rollController = TextEditingController();
  final cityController = TextEditingController();

  String selectedCourse = "B.Tech Computer Science";

  final List<String> courses = [
    "B.Tech Computer Science",
    "B.Tech AI & DS",
    "BCA",
    "BBA",
    "MCA",
  ];

  void resetForm() {
    _formKey.currentState!.reset();

    nameController.clear();
    emailController.clear();
    mobileController.clear();
    rollController.clear();
    cityController.clear();

    setState(() {
      selectedCourse = courses.first;
    });
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              SizedBox(height: 10),
              Text(
                "Student Registered Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              infoRow("Name", nameController.text),
              infoRow("Email", emailController.text),
              infoRow("Mobile", mobileController.text),
              infoRow("Roll No", rollController.text),
              infoRow("Course", selectedCourse),
              infoRow("City", cityController.text),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            )
          ],
        ),
      );
    }
  }

  static Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  InputDecoration decoration(
      String label, IconData icon, String hint) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Student Registration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              const Text(
                "Please fill in the details to register",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
                decoration: decoration(
                    "Full Name", Icons.person, "Enter your name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                decoration: decoration(
                    "Email Address", Icons.email, "Enter email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: decoration(
                    "Mobile Number", Icons.phone, "Enter mobile"),
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return "Enter 10-digit mobile number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: rollController,
                decoration: decoration(
                    "Roll Number", Icons.badge, "Enter roll number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter roll number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedCourse,
                decoration: decoration(
                    "Course", Icons.book, "Select Course"),
                items: courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: cityController,
                decoration:
                    decoration("City", Icons.location_city, "Enter city"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter city";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: resetForm,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Reset"),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: submitForm,
                      icon: const Icon(Icons.send),
                      label: const Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}