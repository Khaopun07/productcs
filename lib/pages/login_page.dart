import 'package:flutter/material.dart';
import 'package:productcs/controllers/auth_service.dart';
import 'package:productcs/pages/user.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');

      try {
        bool success = await AuthService().login(_usernameController.text, _passwordController.text);
        if (success) {
          Navigator.pushReplacementNamed(context, '/user'); // Navigate to the User screen
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed. Please try again.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e')),
        );
      }
    }
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }
  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA2D5AB),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'loginTitle',
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 158, 111),
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  _buildTextField(_usernameController, 'Username', false, Icons.person),
                  SizedBox(height: 20),
                  _buildTextField(_passwordController, 'Password', true, Icons.lock),
                  SizedBox(height: 30),
                  _buildLoginButton(),
                  SizedBox(height: 10),
                  _buildRegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, bool isPassword, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[600]),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $hintText';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _navigateToLogin,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 80.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color.fromARGB(255, 0, 158, 111),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.login, color: Colors.white),
          SizedBox(width: 10),
          Text(
            'Confirm',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: _navigateToRegister,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person_add, color: Color.fromARGB(255, 47, 194, 120)),
          SizedBox(width: 5),
          Text(
            'Register',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 158, 111),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2.0,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
