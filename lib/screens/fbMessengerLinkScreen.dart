import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsappshare/components/customButtomSheet.dart';

import 'file:///C:/Users/shash/OneDrive/Desktop/flutterProjects/SocialLinkGenerator/lib/utilities/constant.dart';

class FbMessengerLinkScreen extends StatefulWidget {
  @override
  _FbMessengerLinkScreenState createState() => _FbMessengerLinkScreenState();
}

class _FbMessengerLinkScreenState extends State<FbMessengerLinkScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final _formKey = GlobalKey<FormState>();

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
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        icon: Icon(
          FlatIcons.settings_5,
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            String link = "http://m.me/$pageName";
            var sheetData = await customBottomSheet(
              context,
              link,
              CustomBottomSheetType.fbMessenger,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                // behavior: SnackBarBehavior.floating,
                content: Text('Wrong Input'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                ),
              ),
            );
          }
        },
      ),
//      endDrawer: GlobalDrawer(),
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
          ],
        ),
      ),
      body: Column(
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
          Expanded(
            child: Container(
//              height: MediaQuery.of(context).size.height - 165,
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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    primary: false,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 7,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 15),
                                  child: Text(
                                    "Facebook Page Name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) return 'Please Fill';
                                    return null;
                                  },
                                  decoration: kGreyInputDecoration.copyWith(
                                      hintText: 'Enter page name'),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
