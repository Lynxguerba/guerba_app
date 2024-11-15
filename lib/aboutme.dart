// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guerba_app/api/google_signin_api.dart';
import 'package:guerba_app/chiper.dart';
import 'package:guerba_app/project.dart';
import 'package:guerba_app/welcome_page.dart';
import 'login_page.dart';

class AboutMe extends StatelessWidget {
  final GoogleSignInAccount user;

  AboutMe({
    Key? key,
    required this.user,
  }) : super(key: key);

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
                  image: AssetImage('assets/images/nv-img.jpg'),
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
                        builder: (context) => WelcomePage(user: user)));
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Cipher'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chiper(user: user)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About Me'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Projects'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Projects(user: user,)));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () async {
                await GoogleSignInApi.logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 20, 0, 60), // Dark center color
              Color.fromARGB(255, 0, 0, 30), // Outer darker color
              Color.fromARGB(255, 0, 0, 10), // Outer darker color
            ],
            radius: 1.5,
            center: Alignment(0.3, -0.5), // Adjust to position the glow
            focal: Alignment.center,
            focalRadius: 0.1,
          ),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ABOUT ME',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00d1ff)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Text(
                    'Hi! I’m Dinno Guerba, a 3rd-year college student with a passion for developing intuitive and user-friendly UI/UX designs. Ever since I was introduced to the world of digital design, I’ve been fascinated by how user experience and interface design can shape the way people interact with technology. Let’s create something amazing together!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/about-me.png',
                        width: 300,
                        height: 500,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'CREDENTIALS',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00d1ff)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/credentials.png',
                        width: 300,
                        height: 360,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Education',
                        style: TextStyle(
                          color: Color(0xFF00d1ff),
                          fontSize: 25,
                        ),
                      ),
                    ),
                    // HERE I WANT TO INSERT A TEXT
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New Corella National High School',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // HERE I WANT TO INSERT A TEXT
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 35.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '• 2015 - 2022',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // HERE I WANT TO INSERT A TEXT
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Davao del Norte State College',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // HERE I WANT TO INSERT A TEXT
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 35.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '• Bachelor of Science in Information Technology',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // HERE I WANT TO INSERT A TEXT
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Skills',
                        style: TextStyle(
                          color: Color(0xFF00d1ff),
                          fontSize: 25,
                        ),
                      ),
                    ),
                    // HERE I WANT TO INSERT A TEXT
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'UI/UX Design',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Software Developer',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'Website Developer',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
