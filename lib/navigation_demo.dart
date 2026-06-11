import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 8 Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> courses = const [
    "Flutter",
    "Dart",
    "Java",
    "Python",
    "Database"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course List"),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(courses[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(courseName: courses[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String courseName;

  const DetailsScreen({
    super.key,
    required this.courseName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              courseName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}