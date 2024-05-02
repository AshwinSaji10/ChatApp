import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> 
{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
        child: Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Username field
                TextFormField(
                  controller: _usernameController, // Assign controller
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null; // Return null for valid input
                  },
                ),
                SizedBox(height: 20.0),

                // Password field
                TextFormField(
                  controller: _passwordController, // Assign controller
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    // Obscure password for security
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Toggle visibility based on state
                        _showPassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: !_showPassword, // Set obscureText based on state
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null; // Return null for valid input
                  },
              ),
              SizedBox(height: 20.0),

              // Login button
              Center(
                child:ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform login logic using username and password
                    // (replace this with your actual login functionality)
                    // print('Username: ${_usernameController.text}');
                    // print('Password: ${_passwordController.text}');
                    // Handle successful login or display error message
                  }
                },
                child: Text('Register'),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool _showPassword = false;
}