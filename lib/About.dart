import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// class About extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var _width = MediaQuery.of(context).size.width - 50;
//     var _height = MediaQuery.of(context).size.height - 50;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(children: <Widget>[
//           SizedBox(
//             height: 70.0,
//           ),
//           Container(
//             alignment: Alignment.center,
//             height: 150.0,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset("Assets/glug_logo.jpg"),
//             ),
//           ),
//           Text(
//             "GITAM GLUG",
//             style: GoogleFonts.openSans(
//               textStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//           SizedBox(height: 20.0),

//           Text(
//             "Description",
//             style: GoogleFonts.openSans(
//               textStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment(
//               _width,
//               _height,
//             ),
//             child: Text("DATA"),
//           ),
//         ]),
//       ),
//     );
//   }
// }

bool a;
List<String> l5 = [
  "Assets/me.jpg",
  "Assets/play.webp",
  "Assets/wait.webp",
  "Assets/stop.webp",
  "Assets/icon1.png",
  "Assets/Appdev.jpg"
];

class About extends StatelessWidget {
  var _itemCount = 2;
  var _count = 10;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            itemCount: _itemCount,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int pageNumber) {
              return FutureBuilder(
                future: this._fetchPage(_count, context),
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
                        return this._Buildpage(snapshot.data);
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
      a = true;
      return a;
    }
    if (i % 2 != 0) {
      a = false;
      return a;
    }
  }

  Widget _Buildpage(bool page) {
    if (page == true) {
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

    if (page == false) {
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
}

