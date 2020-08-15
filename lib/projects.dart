import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

List<String> images = [
  "Assets/Doorlock.jpg",
  "Assets/Webdev.jpg",
  "Assets/Appdev.jpg",
  "Assets/linux.png",
  "Assets/me.jpg",
  "Assets/glug_logo.jpg"
];

List<String> l1 = [
  'Project 1',
  'Project 2',
  'Project 3',
  'Project 4',
  'Project 5',
  'Project 6'
];
List<String> l2 = [
  'Description 1',
  'Description 2',
  'Description 3',
  'Description 4',
  'Description 5',
  'Description 6'
];

class Project extends StatefulWidget {
  Projectstate createState() => new Projectstate();
}

class Projectstate extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projects',
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
                  "Projects",
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
                        fontWeight: FontWeight.w600,
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

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  var currentpage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentpage = controller.page;
      });
    });
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Cardscrollwidget(currentpage),
            Positioned.fill(
              child: PageView.builder(
                itemCount: images.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(90.0),
              bottomLeft: Radius.circular(90.0),
            ),
          ),
          child: ListView.builder(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: l1.length,
              itemBuilder: (BuildContext context, int index) {
                return new Stack(
                  children: <Widget>[
                    Container(
                      alignment: FractionalOffset.topLeft,
                      padding: EdgeInsets.only(left: 20.0),
                      height: 100.0,
                      child: Column(children: <Widget>[
                        SizedBox(height: 10.0),
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
                          height: 5.0,
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
                          height: 10.0,
                        ),
                      ]),
                    ),
                  ],
                );
              }),
        ),
      ]),
    );
  }
}

class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  var currentpage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentpage = controller.page;
      });
    });
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Cardscrollwidget1(currentpage),
            Positioned.fill(
              child: PageView.builder(
                itemCount: images.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(90.0),
              bottomLeft: Radius.circular(90.0),
            ),
          ),
          child: ListView.builder(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: l1.length,
              itemBuilder: (BuildContext context, int index) {
                return new Stack(
                  children: <Widget>[
                    Container(
                      alignment: FractionalOffset.topLeft,
                      padding: EdgeInsets.only(left: 20.0),
                      height: 100.0,
                      child: Column(children: <Widget>[
                        SizedBox(height: 10.0),
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
                          height: 5.0,
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
                          height: 10.0,
                        ),
                      ]),
                    ),
                  ],
                );
              }),
        ),
      ]),
    );
  }
}

var cardaspectratio = 12.0 / 16.0;
var widgetaspectratio = cardaspectratio * 1.2;

class Cardscrollwidget extends StatelessWidget {
  var currentpage;
  var padding = 20.0;
  var verticalinset = 20.0;

  Cardscrollwidget(this.currentpage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetaspectratio,
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safewidth = width - 2 * padding;
        var safeheight = height - 2 * padding;

        var heightOfPrimaryCard = safeheight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardaspectratio;

        var primaryCardLeft = safewidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardlist = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentpage;
          bool isonright = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isonright ? 15.0 : 1.0),
                  0.0);

          var carditem = Positioned.directional(
            top: padding + verticalinset * max(-delta, 0.0),
            bottom: padding + verticalinset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                child: AspectRatio(
                  aspectRatio: cardaspectratio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              l1[i],
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              l2[i],
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          cardlist.add(carditem);
        }
        return Stack(
          children: cardlist,
        );
      }),
    );
  }
}

var cardaspectratio1 = 12.0 / 16.0;
var widgetaspectratio1 = cardaspectratio1 * 1.2;
class Cardscrollwidget1 extends StatelessWidget {
  var currentpage;
  var padding = 20.0;
  var verticalinset = 20.0;

  Cardscrollwidget1(this.currentpage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetaspectratio1,
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safewidth = width - 2 * padding;
        var safeheight = height - 2 * padding;

        var heightOfPrimaryCard = safeheight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardaspectratio1;

        var primaryCardLeft = safewidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardlist = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentpage;
          bool isonright = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isonright ? 15.0 : 1.0),
                  0.0);

          var carditem = Positioned.directional(
            top: padding + verticalinset * max(-delta, 0.0),
            bottom: padding + verticalinset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                child: AspectRatio(
                  aspectRatio: cardaspectratio1,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              l1[i],
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              l2[i],
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          cardlist.add(carditem);
        }
        return Stack(
          children: cardlist,
        );
      }),
    );
  }
}
