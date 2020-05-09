import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer.dart';

class MessengerLink extends StatefulWidget {
  @override
  _MessengerLinkState createState() => _MessengerLinkState();
}

class _MessengerLinkState extends State<MessengerLink> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  String pageName = "";

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
      key: _drawerKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        icon: Icon(
          FlatIcons.settings_5,
        ),
        onPressed: () {
          Share.share("http://m.me/$pageName");
        },
      ),
      endDrawer: GlobalDrawer(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowCircleLeft),
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.blue,
              onPressed: () {
                _drawerKey.currentState.openEndDrawer();
              },
            ),
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
                      FontAwesomeIcons.facebookMessenger,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Text(
                      "Messenger Link Generator",
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
                  Color(0xFF00B4DB),
                  Color(0xFF0083B0),
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
                                "Facebook Page Name",
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
                                hintText: "Enter page Name",
                                fillColor: Colors.white70,
                              ),
                              minLines: 5,
                              maxLines: 8,
                              keyboardType: TextInputType.text,
                              onChanged: (pageNameInput) {
                                setState(
                                  () {
                                    pageName = pageNameInput;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

//                  Text("Number is ${widget.number}"),
//                  Text("Number is ${widget.dialCode.substring(
//                    1,
//                  )}"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
