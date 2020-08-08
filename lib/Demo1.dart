import 'package:Myapp/main.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class Demo1 extends StatefulWidget {
  @override
  Astate createState() => Astate();
}

class Astate extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
    int _currentpage = 0;
    void _onBottomNavBarTab(int index) {
      setState(() {
        _currentpage = index;
      });
    }

    final List<Widget> _bodychilden = [
      Center(
        child: Text("data1"),
      ),
      Center(
        child: Text("data2"),
      ),
      Center(
        child: Text("data3"),
      ),
    ];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Myapp()));
              },
            ),
          ],
        ),
      ),
      body: _bodychilden[_currentpage],
      bottomNavigationBar: BottomNavigationBar(
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
