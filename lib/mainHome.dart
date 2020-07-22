import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import 'drawer.dart';
import 'screens/email.dart';
import 'screens/messenger.dart';
import 'screens/whatsapp.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
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
        label: Text("Invite"),
        icon: Icon(
          FlatIcons.share_1,
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
              icon: Icon(FontAwesomeIcons.info),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                _drawerKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/SocialLinkLogo.png',
                        height: 50,
                      ),
                      Text(
                        "Social Links App",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),

//
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                height: MediaQuery.of(context).size.height - 165,
                child: GridView.count(
                  padding: EdgeInsets.all(15),
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: 25.0,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Whatsapp(),
                          ),
                        );
                      },
                      child: Container(
                        height: 124.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(18.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.green[400],
                              blurRadius: 15.0,
                              offset: Offset(0.0, 5.0),
                            )
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.whatsapp,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => MessengerLink(),
                          ),
                        );
                      },
                      child: Container(
                        height: 124.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(18.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.blue[400],
                              blurRadius: 15.0,
                              offset: Offset(0.0, 5.0),
                            )
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.facebookMessenger,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EmailLink(),
                          ),
                        );
                      },
                      child: Container(
                        height: 124.0,
                        decoration: BoxDecoration(
                          color: Color(0xfff5af19),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(18.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0xfff5af19),
                              blurRadius: 15.0,
                              offset: Offset(0.0, 5.0),
                            )
                          ],
                        ),
                        child: Icon(
                          Icons.email,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
