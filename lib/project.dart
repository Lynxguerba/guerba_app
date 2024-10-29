// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, , prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables
// prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:guerba_app/aboutme.dart';
import 'package:guerba_app/chiper.dart';
import 'package:guerba_app/login_page.dart';
import 'package:guerba_app/welcome_page.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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
            color: _currentPage == index ? Colors.white : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );  }

  @override
  Widget build(BuildContext context) {
    final int _numPages = 3;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 0, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 0, 30),
        iconTheme: IconThemeData(
          color: Colors.white
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage(accountName: '',)));
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
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                Center(
                    child: Text('Page 1',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                Center(
                    child: Text('Page 2',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                Center(
                    child: Text('Page 3',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildPageIndicator(_numPages),
          ),
        ],
      ),
    );
  }
}
