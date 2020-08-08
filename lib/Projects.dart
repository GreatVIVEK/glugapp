import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

List<String> images = [
  "Assets/523841.jpg",
  "Assets/523841.jpg",
  "Assets/523841.jpg",
  "Assets/523841.jpg",
  "Assets/523841.jpg",
  "Assets/523841.jpg"
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

var cardaspectratio = 12.0 / 16.0;
var widgetaspectratio = cardaspectratio * 1.2;

class Projectdemo extends StatefulWidget {
  Projectdemostate createState() => new Projectdemostate();
}

class Projectdemostate extends State<Projectdemo> {
  var currentpage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentpage = controller.page;
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(children: <Widget>[
                Text(
                  "Projects",
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text("Completed"),
                ),
              ],
            ),
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
              child: Tab1(),
            ),
          ],
        ),
      ),
    );
  }
}

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

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:10.0),
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(90.0),
          bottomLeft: Radius.circular(90.0),
        ),
      ),
      child: ListView.builder(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
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
    );
  }
}
