// lib/main.dart

// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_page.dart'; // Import the WelcomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TEXT CONTROLLER with pre-filled values
  final _emailController = TextEditingController(text: 'sample@gmail.com');
  final _passwordController = TextEditingController(text: 'admin123');

  // Dummy function for sign in
  void signIn() {
    if (_emailController.text == 'sample@gmail.com' &&
        _passwordController.text == 'admin123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage(accountName: '',)),
      );
    } else {
      print("Invalid credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset(
                  'assets/images/chatbot.jpg',
                  width: 100,
                  height: 100,
                ),
                Text(
                  'GuerbsWorld!',
                  style: GoogleFonts.bebasNeue(fontSize: 52),
                ),
                Text(
                  'Welcome! You\'ve been missed!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 50),

                // TEXT FIELD EMAIL
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF00d1FF)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // TEXT FIELD PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF00d1FF)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // SIGNIN BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF00D1FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // REGISTER ACCOUNT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have no Account?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add navigation to registration screen
                        print("Register button tapped!");
                      },
                      child: Text(
                        ' Register Now!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 179, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
