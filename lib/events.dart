import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:carousel_slider/carousel_slider.dart';

List<String> l1 = ['Event1', 'Event1', 'Event1', 'Event1', 'Event1', 'Event1'];
List<String> l2 = [
  'Description1',
  'Description1',
  'Description1',
  'Description1',
  'Description1',
  'Description1'
];
List<String> l5 = [
  "Assets/Glug_logo.jpg",
  "Assets/Doorlock.jpg",
  "Assets/Webdev.jpg",
  "Assets/Appdev.jpg",
  "Assets/linux.png",
  "Assets/me.jpg"
];
int current;

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Events',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  "Events",
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
            backgroundColor: Color(0xFFEEEEEE),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Current",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Completed",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
              indicatorColor: Colors.black,
            ),
          ),
          body: TabBarView(children: [
            Tab1(),
            Tab2(),
          ]),
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Carouseldemo(),
            Container(
              child: GridView.builder(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: l1.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 18.0,
                      crossAxisSpacing: 18.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      decoration: new BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      child: Column(children: <Widget>[
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
                          height: 36.0,
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
                      ]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Carouseldemo(),
        Container(
          child: GridView.builder(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: l1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.0,
                  crossAxisSpacing: 18.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  decoration: new BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: Column(children: <Widget>[
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
                      height: 36.0,
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
                  ]),
                );
              }),
        )
      ]),
    );
  }
}

class Carouseldemo extends StatefulWidget {
  Carouseldemo() : super();
  @override
  Carouselstate createState() => Carouselstate();
}

class Carouselstate extends State<Carouseldemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              aspectRatio:18/9,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              reverse: true,
            ),
            items: [1, 2, 3, 4, 5].map((index) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  //width: 200.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.asset(
                    l5[index],
                    fit: BoxFit.fill,
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
