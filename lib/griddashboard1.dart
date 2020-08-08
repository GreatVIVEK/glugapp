import 'package:Myapp/About.dart';
import 'package:Myapp/Groups.dart';
import 'package:Myapp/Members.dart';

import 'package:Myapp/Projects.dart';

import 'package:Myapp/events.dart';
import 'Demo1.dart';
import 'Groups.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Test.dart';

List<String> l1 = ['Members', 'Events', 'Projects', 'Groups', 'About'];
List<String> l2 = [
  "April,2020",
  "May,2020",
  "June,2020",
  "July,2020",
  "August,2020"
];
List<String> l3 = [
  "Assets/music.webp",
  "Assets/play.webp",
  "Assets/wait.webp",
  "Assets/stop.webp",
  "Assets/icon1.png",
];

class Griddashboard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: GridView.builder(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: l1.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18.0,
                    mainAxisSpacing: 18.0),
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Members(),
                          ),
                        );
                      }
                      if (index == 1) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Events(),
                          ),
                        );
                      }
                      if (index == 2) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Projectdemo(),
                          ),
                        );
                      }
                      if (index == 3) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Group(),
                          ),
                        );
                      }
                      if (index == 4) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 100),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secanimation,
                                  Widget child) {
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secanimation) {
                                return Demo1();
                              }),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              offset: Offset(10.0, 10.0),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            l3[index],
                            width: 42,
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            l1[index],
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            l2[index],
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black38,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
