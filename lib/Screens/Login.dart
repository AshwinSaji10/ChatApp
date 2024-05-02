import 'package:flutter/material.dart';
import 'package:chat_app/Screens/Register.dart';
import 'package:chat_app/Providers/AuthProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Screens/Home.dart';
// import Fluttertoast

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // Create a Form key for validation

  // Declare controllers for username and password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  
  Widget build(BuildContext context) 
  {
    final authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
     case Status.authenticateError:
       Fluttertoast.showToast(msg: 'Sign in failed');
       break;
     case Status.authenticateCanceled:
       Fluttertoast.showToast(msg: 'Sign in cancelled');
       break;
     case Status.authenticated:
       Fluttertoast.showToast(msg: 'Sign in successful');
       break;
     default:
       break;
  }
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Login'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView
      (
        // Allow content to scroll if needed
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
                onPressed: () async{
                  bool isSuccess = await authProvider.handleGoogleSignIn();
                  if (isSuccess) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home()));
                  }
                },
                child: Text('Login'),
              )
              ),
              Center(
                child:TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));
                },
                child: Text('New User? Register'),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // State variable to control password visibility
  bool _showPassword = false;
}
