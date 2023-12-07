import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../router.dart';

class AuthenPage extends StatefulWidget {
  const AuthenPage({super.key});

  @override
  State<AuthenPage> createState() => _AuthenPageState();
}

class _AuthenPageState extends State<AuthenPage> {
  int _counter = 0;
  String _errorMessage = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Navigate to the second page when the button is pressed
    // Note: Add your authentication logic here using the entered email and password
    if (_emailController.text == 'a' && _passwordController.text == 'a') {
      // Successful login, navigate to the next page
      AppRouter.router.navigateTo(context, '/subjectAll', transition: TransitionType.cupertino);
      print('Successful login');
      _errorMessage = ''; // Clear any previous error message
    } else {
      // Invalid credentials, show an error message
      print('Invalid credentials');
      _errorMessage = 'Invalid email or password';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF97BCE8),
              Color(0xFF2867B0),
            ],
          ),
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/reg_human.png', // Replace 'your_image.png' with the actual image asset path
                          width: 180, // Adjust the width as needed
                          height: 180, // Adjust the height as needed
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "LOGIN TO YOUR ACCOUNT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Email input
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.person, color: Colors.blue),
                          ),
                          keyboardType: TextInputType.emailAddress, // Suggest email address keyboard
                        ),
                        const SizedBox(height: 10),
                        // Password input
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                          ),
                          keyboardType: TextInputType.visiblePassword, // Suggest visible password keyboard
                        ),
                        const SizedBox(height: 20),
                        // Login button
                        TextButton(
                          onPressed: _incrementCounter,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Error message
                        Text(
                          _errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
