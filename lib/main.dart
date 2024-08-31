import 'package:flutter/material.dart';
import 'package:productcs/pages/login_page.dart';
import 'package:productcs/pages/register_page.dart';
import 'package:productcs/pages/user.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/user': (context) => UserPage(), 
      },
    );
  }
}
