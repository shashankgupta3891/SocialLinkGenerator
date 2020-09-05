import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsappshare/constant.dart';
import 'package:whatsappshare/model/carbonCopyListModel.dart';
import 'package:whatsappshare/validation.dart';
import '../drawer.dart';

class EmailLink extends StatefulWidget {
  @override
  _EmailLinkState createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _ccAnimatedList = GlobalKey<AnimatedListState>();

  String emailId = "";
  String emailSubject = "";
  String emailBody = "";
  List<String> carbonCopyList = [];

  List<Widget> _ccTextField() {
    List<Widget> textField = [];

    carbonCopyList.asMap().forEach((key, value) {
      textField.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: carbonCopyList[key],
                validator: (value) {
                  if (value.isEmpty) return 'Please Fill';
                  if (!isEmailId(value)) return 'Email is not valid';
                  return null;
                },
                decoration:
                    kGreyInputDecoration.copyWith(hintText: 'Enter Email Id'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (pageNameInput) {
                  setState(
                    () {
                      carbonCopyList[key] = pageNameInput;
                      print(carbonCopyList);
                    },
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.minus),
              onPressed: () {
                setState(() {
                  var removed = carbonCopyList.removeAt(key);
                  print(carbonCopyList);
                  print(removed);
                });
              },
            )
          ],
        ),
      ));
    });

    return textField;

    return List<Widget>.generate(carbonCopyList.length, (int index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: carbonCopyList[index],
                validator: (value) {
                  if (value.isEmpty) return 'Please Fill';
                  if (!isEmailId(value)) return 'Email is not valid';
                  return null;
                },
                decoration:
                    kGreyInputDecoration.copyWith(hintText: 'Enter Email Id'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (pageNameInput) {
                  setState(
                    () {
                      carbonCopyList[index] = pageNameInput;
                      print(carbonCopyList);
                    },
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.minus),
              onPressed: () {
                setState(() {
                  var removed = carbonCopyList.removeAt(index);
                  print(carbonCopyList);
                  print(removed);
                });
              },
            )
          ],
        ),
      );
    });
  }

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
          if (_formKey.currentState.validate()) {
            Share.share(
                "mailto:$emailId?subject=$emailSubject&body=$emailBody");
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
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 7,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 15),
                                  child: Text(
                                    "Carbon Copy",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                // Column(
                                //   children: _ccTextField(),
                                // ),
                                AnimatedList(
                                    physics: NeverScrollableScrollPhysics(),
                                    key: _ccAnimatedList,
                                    shrinkWrap: true,
                                    initialItemCount: carbonCopyList.length,
                                    itemBuilder: (context, index, animation) {
                                      return _buildWidget(animation, index);
                                    }),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Add',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _ccAnimatedList.currentState
                                          .insertItem(carbonCopyList.length);
                                      // Provider.of<CCListModel>(context)
                                      //     .addTaskToList();
                                      carbonCopyList.add('');
                                    });
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
              ),
            ),
          )
        ],
      ),
    );
  }

  SizeTransition _buildWidget(Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: carbonCopyList[index],
                validator: (value) {
                  if (value.isEmpty) return 'Please Fill';
                  if (!isEmailId(value)) return 'Email is not valid';
                  return null;
                },
                decoration:
                    kGreyInputDecoration.copyWith(hintText: 'Enter Email Id'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (pageNameInput) {
                  setState(
                    () {
                      carbonCopyList[index] = pageNameInput;
                      print(carbonCopyList);
                    },
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.minus),
              onPressed: () {
                setState(() {
                  var removed = carbonCopyList.removeAt(index);

                  _ccAnimatedList.currentState.removeItem(index,
                      (context, animation) => _buildWidget(animation, index));

                  print(carbonCopyList);
                  print(removed);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
