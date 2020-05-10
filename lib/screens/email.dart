import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer.dart';

class EmailLink extends StatefulWidget {
  @override
  _EmailLinkState createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  String emailId = "";
  String emailSubject = "";
  String emailBody = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0x00000000),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
//      key: _drawerKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        icon: Icon(
          FlatIcons.settings_5,
        ),
        onPressed: () {
          Share.share("mailto:$emailId?subject=$emailSubject&body=$emailBody");
        },
      ),
//      endDrawer: GlobalDrawer(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowCircleLeft),
              color: Color(0xFFf12711),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
//            IconButton(
//              icon: Icon(Icons.menu),
//              color: Color(0xFFf12711),
//              onPressed: () {
//                _drawerKey.currentState.openEndDrawer();
//              },
//            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Color(0xFFf12711),
                      size: 40,
                    ),
                    Text(
                      "Email Link Generator",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                  ],
                ),
              ),

//
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 165,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                colors: [
                  Color(0xFFf12711),
                  Color(0xFFf5af19),

//                  Color(0xFF0f0c29),
//                  Color(0xFF302b63),
//                  Color(0xFF24243e),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 15, top: 30, right: 15, bottom: 25),
              child: ListView(
                primary: false,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 7,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Text(
                                "Email Id",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: "Enter Email Id",
                                fillColor: Colors.white70,
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (pageNameInput) {
                                setState(
                                  () {
                                    emailId = pageNameInput;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 7,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Text(
                                "Subject",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: "Enter Text Here",
                                fillColor: Colors.white70,
                              ),
                              minLines: 1,
                              maxLines: 4,
                              keyboardType: TextInputType.text,
                              onChanged: (textInput) {
                                setState(
                                  () {
                                    emailSubject = Uri.encodeFull(textInput);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 7,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Text(
                                "Body",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: "Enter Text Here",
                                fillColor: Colors.white70,
                              ),
                              minLines: 2,
                              maxLines: 5,
                              keyboardType: TextInputType.text,
                              onChanged: (textInput) {
                                setState(
                                  () {
                                    emailBody = Uri.encodeFull(textInput);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
