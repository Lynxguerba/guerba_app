// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guerba_app/aboutme.dart';
import 'package:guerba_app/api/google_signin_api.dart';
import 'package:guerba_app/chiper.dart';
import 'package:guerba_app/project.dart';
import 'login_page.dart'; // Import the login page
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
  // const WelcomePage({super.key});

  final GoogleSignInAccount user;

  WelcomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode.externalApplication); // Open in external browser
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make background color transparent
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
                  fit: BoxFit.cover,
                ),
              ),
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
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Cipher'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chiper(
                            user: user,
                          )),
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
                      builder: (context) => AboutMe(
                            user: user,
                          )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Projects'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Projects(
                            user: user,
                          )),
                );
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 160),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            Colors.blue,
                            const Color.fromARGB(255, 207, 1, 243),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height),
                        ),
                        blendMode: BlendMode.srcIn,
                        child: Text(
                          '"Innovative',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.archivoBlack(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            Colors.blue,
                            const Color.fromARGB(255, 207, 1, 243),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height),
                        ),
                        blendMode: BlendMode.srcIn,
                        child: Text(
                          'Expressions"',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.archivoBlack(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '– Perfect for showcasing a range of',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'creative or technical projects.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: 'Annyeong!! I’m '),
                      TextSpan(
                        text: 'Dinno Guerba',
                        style: TextStyle(color: Color(0xFF00d1ff)),
                      ),
                      TextSpan(text: ', UI/UX'),
                    ],
                  ),
                ),
                Text(
                  'Designer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchURL('https://github.com/Lynxguerba');
                      },
                      child: Image.asset(
                        'assets/images/github.png',
                        width: 27,
                        height: 27,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _launchURL('https://web.facebook.com/dinno.guerba.5');
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),

                // Spacer to push the button to the bottom
                Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chiper(
                                    user: user,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('CONTINUE',
                              style: TextStyle(fontSize: 14)),
                          const Icon(Icons.arrow_forward, size: 18.0),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
