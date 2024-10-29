// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, , prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
// prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:guerba_app/aboutme.dart';
import 'package:guerba_app/chiper.dart';
import 'package:guerba_app/login_page.dart';
import 'package:guerba_app/welcome_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode.externalApplication); // Open in external browser
    } else {
      throw 'Could not launch $url';
    }
  }

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageIndicator(int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: _currentPage == index ? 12.0 : 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? Color(0xff00d1ff) : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final int _numPages = 3;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 0, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 0, 30),
        iconTheme: IconThemeData(color: Colors.white),
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomePage(
                              accountName: '',
                            )));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutMe()));
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
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            // ignore: prefer_const_literals_to_create_immutables
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Projects',
                  style: TextStyle(
                      color: Color(0xff00d1ff),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // PROJECT 1
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/project1.png',
                          width: 300,
                          height: 300,
                        ),

                        // PROJECT TITLE
                        Text(
                          'Daily Time Record System',
                          style: TextStyle(
                              color: Color(0xFF0dd1ff),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        // PROJECT DETAILS
                        Text(
                          'A web tool, is the process of monitoring and organizing time information.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 100,
                          height: 40,
                          child: 
                            OutlinedButton(
                              onPressed: () {
                                _launchURL('http://dtr.kesug.com/');
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                'Visit',
                                style: TextStyle(
                                  color: Color(0xFF0dd1ff),
                                  fontSize: 16,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(
                                    0xFF0dd1ff), // Text color for the button
                                side: BorderSide(
                                    color: Color(0xFF0dd1ff)), // Outline color
                              ),
                            )
                          
                        ),
                      ],
                    ),
                  ),

                  // PROJECT 2
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/project2.png',
                          width: 300,
                          height: 300,
                        ),

                        // PROJECT TITLE
                        Text(
                          'Cloning Website',
                          style: TextStyle(
                              color: Color(0xFF0dd1ff),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        // PROJECT DETAILS
                        Text(
                          'TESDA Website that I re-design.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                            width: 100,
                            height: 40,
                            child: OutlinedButton(
                              onPressed: () {
                                _launchURL('https://lynxguerba.github.io/Tesda-Final_Project/');
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                'Visit',
                                style: TextStyle(
                                  color: Color(0xFF0dd1ff),
                                  fontSize: 16,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(
                                    0xFF0dd1ff), // Text color for the button
                                side: BorderSide(
                                    color: Color(0xFF0dd1ff)), // Outline color
                              ),
                            )),
                      ],
                    ),
                  ),

                  // PROJECT 3
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/project3.png',
                          width: 300,
                          height: 300,
                        ),

                        // PROJECT TITLE
                        Text(
                          'Google Site Design',
                          style: TextStyle(
                              color: Color(0xFF0dd1ff),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        // PROJECT DETAILS
                        Text(
                          'Also I work on Google Site projects. Trying to developed website designs.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                            width: 100,
                            height: 40,
                            child: OutlinedButton(
                              onPressed: () {
                                _launchURL(
                                    'https://sites.google.com/dnsc.edu.ph/group4site/home');
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                'Visit',
                                style: TextStyle(
                                  color: Color(0xFF0dd1ff),
                                  fontSize: 16,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(
                                    0xFF0dd1ff), // Text color for the button
                                side: BorderSide(
                                    color: Color(0xFF0dd1ff)), // Outline color
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildPageIndicator(_numPages),
            ),
          ],
        ),
      ),
    );
  }
}
