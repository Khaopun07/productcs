import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  String _selectedRole = 'User';  // ค่าเริ่มต้นเป็น 'User'

  void _register() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    String role = _selectedRole;

    print('Username: $username');
    print('Password: $password');
    print('Name: $name');
    print('Role: $role');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA2D5AB),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 158, 111),
        title: Hero(
          tag: 'loginTitle',
          child: Text('REGISTER'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color:  Color.fromARGB(255, 0, 158, 111),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 158, 111),
                  ),
                ),
                SizedBox(height: 40),
                _buildTextField(_usernameController, 'Username', false, Icons.person),
                SizedBox(height: 20),
                _buildTextField(_passwordController, 'Password', true, Icons.lock),
                SizedBox(height: 20),
                _buildTextField(_nameController, 'Name', false, Icons.person_add),
                SizedBox(height: 20),
                _buildRoleChips(),
                SizedBox(height: 30),
                _buildRegisterButton(),
              ],
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
      child: TextField(
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
      ),
    );
  }

  Widget _buildRoleChips() {
    final roles = ['User', 'Admin'];
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: roles.map((role) {
        return ChoiceChip(
          label: Text(role),
          selected: _selectedRole == role,
          onSelected: (selected) {
            setState(() {
              _selectedRole = role;
            });
          },
          selectedColor: Color.fromARGB(255, 255, 74, 19),
          backgroundColor: Colors.white,
          labelStyle: TextStyle(color: _selectedRole == role ? Colors.white : Colors.black),
        );
      }).toList(),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _register,
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
          Icon(Icons.check, color: Colors.white),
          SizedBox(width: 10),
          Text(
            'Confirm',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
