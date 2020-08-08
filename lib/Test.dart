import 'package:Myapp/Home.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

List<String> l5 = [
  "Assets/me.jpg",
  "Assets/play.webp",
  "Assets/wait.webp",
  "Assets/stop.webp",
  "Assets/icon1.png",
  "Assets/Appdev.jpg"
];

class Test extends StatelessWidget {
  var _pageNum = 1000;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            itemCount: _pageNum,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int pageNumber) {
              return FutureBuilder(
                future: this._fetchPage(pageNumber, context),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return SizedBox(
                        height: (MediaQuery.of(context).size.height) / 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        var pageData = snapshot.data;
                        return this._Buildpage(pageData);
                      }
                  }
                },
              );
            }),
      ),
    );
  }

  _fetchPage(int i, BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    if (i % 2 == 0) {
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
      );
    }
    ;
    if (i % 2 != 0) {
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
    ;
  }

  Widget _Buildpage(Widget page) {
    return page;
  }
}
