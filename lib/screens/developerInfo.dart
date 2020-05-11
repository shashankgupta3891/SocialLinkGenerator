import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DevInfo extends StatelessWidget {
  double iconSize = 35;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Visit GitHub"),
        icon: Icon(
          FontAwesomeIcons.github,
        ),
        onPressed: () {
          launch("https://github.com/shashankgupta3891");
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowCircleLeft),
              color: Color(0xFFCB356B),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
//            IconButton(
//              icon: Icon(Icons.menu),
//              color: Colors.green,
//              onPressed: () {},
//            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            colors: [
              Color(0xFFCB356B),
              Color(0xFFBD3F32),

//              Color(0xFF34e89e),
//              Color(0xFF0f3443),

//              Color(0xFFff6a00),
//              Color(0xFFee0979),

//              Color(0xFF4ca2cd),
//              Color(0xFF67B26F),
            ],
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 10, color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white60,
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 4,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 10, color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
//              shape: StadiumBorder(
//                side: BorderSide(
//                  color: Colors.white,
//                  width: 1,
//                ),
//              ),
                      child: Image.asset(
                        "images/IMG_20191110_135433.jpg",
                        height: 300,
                        width: 300,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      "Shashank Gupta",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Thank you so much to install this application. If you would like to Hire me for flutter development project. \n\nSo, You can contact on social media which is given below",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Card(
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.linkedinIn),
                      color: Colors.blue,
                      iconSize: iconSize,
                      onPressed: () {
                        launch(
                            "https://www.linkedin.com/in/shashankgupta3891/");
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.github),
                      iconSize: iconSize,
                      onPressed: () {
                        launch("https://github.com/shashankgupta3891");
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.facebookSquare),
                      iconSize: iconSize,
                      color: Colors.blue,
                      onPressed: () {
                        launch(
                            "https://www.facebook.com/people/Shashank-Gupta/100004769506501");
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.instagram),
                      iconSize: iconSize,
                      color: Color(0xFFCB356B),
                      onPressed: () {
                        launch("https://www.instagram.com/shashank3891/");
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.facebookMessenger),
                      iconSize: iconSize,
                      color: Colors.blue,
                      onPressed: () {
                        launch("https://m.me/100004769506501");
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
