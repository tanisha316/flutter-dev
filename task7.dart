import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Profile',
      home: const HomeScreen(),
    );
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appBarTitle = "Flutter Profile";
  Color appBarColor = Colors.blue;
  String buttonText = "Follow";

  void followUser() {
    setState(() {
      appBarTitle = "Following";
      appBarColor = Colors.green;
      buttonText = "Following";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=12",
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Flutter Developer",
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 10),

              const Text(
                "john.doe@gmail.com",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: followUser,
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}