import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:productcs/models/user_model.dart';
import 'package:productcs/providers/variables.dart';

class AuthService {
  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$apiURL/api/user/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"user_name": username, "password": password}),
      );
      
      if (response.statusCode == 200) {
        // Parse the response or check for success
        return true;
      } else {
        print('Failed to login: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  
  Future<void> register(String username, String password, String name, String role) async {
  try {
    final response = await http.post(
      Uri.parse("$apiURL/api/user/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_name": username,
        "password": password,
        "name": name,
        "role": role,
      }),
    );

    if (response.statusCode == 200) {
      print('Registration successful');
    } else {
      print('Failed to register: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
}