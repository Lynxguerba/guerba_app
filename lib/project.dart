// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:guerba_app/aboutme.dart';
import 'package:guerba_app/chiper.dart';
import 'package:guerba_app/login_page.dart';
import 'package:guerba_app/welcome_page.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});
  
  get accountName => 'dddd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 0, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 0, 30),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/navbar-image.jpg'),
                  fit: BoxFit
                      .cover, // This makes the image cover the whole header
                ),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Image.asset(
                      'assets/images/chatbot.jpg',
                      width: 80,
                      height: 80,
                    ),
                    Flexible(
                      child: Text(
                        'GuerbsWorld',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WelcomePage(accountName: accountName)));
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Chiper'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chiper()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About Me'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AboutMe()));
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Projects'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                print("Logout tapped");
              },
            ),
          ],
        ),
      ),
    );
  }
}
