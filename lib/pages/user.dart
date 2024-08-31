import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the User Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}