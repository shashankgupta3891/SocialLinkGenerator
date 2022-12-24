import 'package:country_code_picker/country_code_picker.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsappshare/components/customButtomSheet.dart';
import 'package:whatsappshare/utilities/constant.dart';
import 'package:whatsappshare/utilities/validation.dart';

class WhatsappLinkScreen extends StatefulWidget {
  @override
  _WhatsappLinkScreenState createState() => _WhatsappLinkScreenState();
}

class _WhatsappLinkScreenState extends State<WhatsappLinkScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  List<String> title = ["Whatsapp Link Generator"];
  List<Icon> titleIcon = [
    Icon(
      FlatIcons.con_whatsapp,
      color: Colors.green,
      size: 40,
    ),
  ];
  List<List<Color>> colorGradient = [
    [
      Color(0xFF0BAB64),
      Color(0xFF3BB78F),
    ]
  ];

  String number = "";
  String text = "";
  String dialCode = "+91";

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
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        icon: Icon(
          FlatIcons.settings_5,
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            String link = "https://wa.me/${dialCode.substring(
                  1,
                ) + number}?text=$text";
            var sheetData = await customBottomSheet(
                context, link, CustomBottomSheetType.whatsapp);
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

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowCircleLeft),
              color: Colors.green,
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
                    titleIcon[0],
                    Text(
                      title[0],
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
                  colors: colorGradient[0],
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
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: CountryCodePicker(
                                    onChanged: (code) {
                                      setState(() {
                                        dialCode = code.dialCode;
                                      });
                                    },
                                    initialSelection: 'IN',
                                    favorite: ['+91'],
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: true,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: TextFormField(
//                                    autovalidate: true,
                                    decoration: kGreyInputDecoration,
                                    validator: (value) {
                                      if (value.isEmpty) return 'Please fill';
                                      if (value.length != 10)
                                        return 'Enter 10 digit Number';
                                      if (!isNumeric(value))
                                        return 'Please Enter valid number';
                                      return null;
                                    },
                                    onChanged: (num) {
                                      setState(() {
                                        number = num;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
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
                                    "Chat Message",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.length == 0)
                                      return 'Please Enter';
                                    return null;
                                  },
                                  decoration: kGreyInputDecoration.copyWith(
                                      hintText: 'Enter Text'),
                                  minLines: 5,
                                  maxLines: 8,
                                  keyboardType: TextInputType.text,
                                  onChanged: (textInput) {
                                    setState(
                                      () {
                                        text = Uri.encodeFull(textInput);
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
