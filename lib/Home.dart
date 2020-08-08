import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'griddashboard1.dart';

import 'Demo1.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Homestate();
  }
}

class Homestate extends State<Home> {
  int _currentpage = 0;
  void _onBottomNavBarTab(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  final List<Widget> _bodychilden = [
    Child1(),
    Center(
      child: Text("data2"),
    ),
    Center(
      child: Text("data3"),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Demo1()));
              },
            ),
          ],
        ),
      ),
      body: _bodychilden[_currentpage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFEEEEEE),
        currentIndex: _currentpage,
        onTap: _onBottomNavBarTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            title: Text("Updates"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}

class Child1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      icon: Icon(Icons.list),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('GLUG',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: (36),
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text("GNU Linux user's group",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: (16),
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
            ),
            Griddashboard1(),
          ],
        ),
      ),
    );
  }
}
