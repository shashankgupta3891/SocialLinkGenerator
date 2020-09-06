import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsappshare/components/multiEmailCard.dart';
import 'package:whatsappshare/constant.dart';
import 'package:whatsappshare/provider/carbonCopyListProvider.dart';

import 'package:whatsappshare/validation.dart';
import '../drawer.dart';

class EmailLink extends StatefulWidget {
  @override
  _EmailLinkState createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  List<String> _carbonCopyList = [];
  List<String> _blindCarbonCopyList = [];

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        icon: Icon(
          FlatIcons.settings_5,
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            String bodyStr = emailBody == '' ? '' : '&body=' + emailBody;
            String ccStr = _carbonCopyList.isNotEmpty
                ? '&bcc=' + _carbonCopyList.join(', ')
                : '';
            String bccStr = _blindCarbonCopyList.isNotEmpty
                ? '&bcc=' + _blindCarbonCopyList.join(', ')
                : '';
            Share.share(
                "mailto:$emailId?subject=$emailSubject$bodyStr$ccStr$bccStr");
          }
          print(_carbonCopyList.join(', '));
        },
      ),
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
          Expanded(
            child: Container(
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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
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
                                    "Email Id",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) return 'Please Fill';
                                    if (!isEmailId(value))
                                      return 'Email is not valid';
                                    return null;
                                  },
                                  decoration: kGreyInputDecoration.copyWith(
                                      hintText: 'Enter Email Id'),
                                  keyboardType: TextInputType.emailAddress,
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
                                    "Subject",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) return 'Please Enter';
                                    return null;
                                  },
                                  decoration: kGreyInputDecoration.copyWith(
                                      hintText: 'Enter Text Here'),
                                  minLines: 1,
                                  maxLines: 4,
                                  keyboardType: TextInputType.text,
                                  onChanged: (textInput) {
                                    setState(
                                      () {
                                        emailSubject =
                                            Uri.encodeFull(textInput);
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
                                    "Body",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                TextField(
                                  onTap: () {
                                    print(_carbonCopyList);
                                  },
                                  decoration: kGreyInputDecoration.copyWith(
                                      hintText: 'Enter Text Here'),
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
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: MultiEmailCard(
                          carbonCopyList: _carbonCopyList,
                          title: "Carbon Copy",
                          // isRemoveButtonActive: _carbonCopyList.isNotEmpty,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: MultiEmailCard(
                          carbonCopyList: _blindCarbonCopyList,
                          title: "Blind Carbon Copy",
                          // isRemoveButtonActive: _blindCarbonCopyList.isNotEmpty,
                        ),
                      ),
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
