import 'package:flutter/material.dart';
import 'package:hacka/ScrapPage.dart';
import 'login.dart'; // Import LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kabadiwala App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LoginPage(), // Start with LoginPage
    );
  }
}
