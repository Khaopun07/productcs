import 'package:flutter/material.dart';
import 'package:productcs/pages/login_page.dart'; // Adjust path according to your directory structure
import 'package:productcs/pages/register_page.dart'; // Adjust path according to your directory structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}
