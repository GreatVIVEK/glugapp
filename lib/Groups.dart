import 'package:Myapp/Home.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

List<String> l1 = [
  'VIVEK',
  'Ruthwik',
  'Anitesh',
  'Venkat',
  'Hanesha',
  'Pranavi'
];
List<String> l2 = [
  'App development',
  'App development',
  'App development',
  'Web development',
  'Web development',
  'Web development'
];
List<String> l5 = [
  "Assets/me.jpg",
  "Assets/play.webp",
  "Assets/wait.webp",
  "Assets/stop.webp",
  "Assets/icon1.png",
  "Assets/Appdev.jpg"
];

class Group extends StatelessWidget {
  var i = l1.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Groups",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                // padding: EdgeInsets.all(5.0),
                physics: ScrollPhysics(),
                itemCount: l1.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _samplewidget(context, index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _samplewidget(BuildContext context, int a) {
    if (a % 2 == 0) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => _Appdev(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            height: 200.0,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "App Development",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 8.0,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "Assets/Appdev.jpg",
                      fit: BoxFit.contain,
                      width: 200.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    if (a % 2 != 0) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "Assets/Webdev.jpg",
                    fit: BoxFit.contain,
                    width: 180.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  "Webpage Development",
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

////////////// App development
class _Appdev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 80.0,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "Assets/Appdev.jpg",
                fit: BoxFit.contain,
                width: 250.0,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
