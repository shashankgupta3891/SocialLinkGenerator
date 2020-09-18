import 'package:auto_size_text/auto_size_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:share/share.dart';

enum CustomBottomSheetType {
  whatsapp,
  fbMessenger,
  email,
}

Future customBottomSheet(
    BuildContext context, String link, CustomBottomSheetType type) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    // backgroundColor: Colors.blue,
    context: context,
    builder: (context) {
      GlobalKey<ScaffoldState> bottomSheetScaffoldKey = GlobalKey();
      return Container(
        height: 300,
        child: Scaffold(
          extendBody: false,
          key: bottomSheetScaffoldKey,
          body: CustomBottomSheetWidget(
            bottomSheetScaffoldKey: bottomSheetScaffoldKey,
            link: link,
            type: type,
          ),
        ),
      );
    },
  );
}

class CustomBottomSheetWidget extends StatefulWidget {
  const CustomBottomSheetWidget({
    Key key,
    @required this.bottomSheetScaffoldKey,
    @required this.link,
    @required this.type,
  }) : super(key: key);
  final String link;
  final GlobalKey<ScaffoldState> bottomSheetScaffoldKey;
  final CustomBottomSheetType type;

  @override
  _CustomBottomSheetWidgetState createState() =>
      _CustomBottomSheetWidgetState();
}

class _CustomBottomSheetWidgetState extends State<CustomBottomSheetWidget> {
  Box<Map> linkDataBox;
  String boxName;

  @override
  void initState() {
    super.initState();
    boxName = boxNameFunc(widget.type);
    linkDataBox = Hive.box(boxName);
  }

  String boxNameFunc(CustomBottomSheetType type) {
    if (type == CustomBottomSheetType.whatsapp) return 'whatsapp';
    if (type == CustomBottomSheetType.fbMessenger) return 'fbMessenger';
    if (type == CustomBottomSheetType.email) return 'email';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.blue,
          height: 20,
        ),
        ListTile(
          title: AutoSizeText(
            'Whatsapp Link',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
              widget.link,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () async {
                      await FlutterClipboard.copy(widget.link);
                      final snackBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Copied to Clipboard'),
                        action: SnackBarAction(
                          onPressed: () {},
                          label: 'Done',
                        ),
                      );
                      widget.bottomSheetScaffoldKey.currentState
                          .showSnackBar(snackBar);
                    },
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.copy,
                          color: Colors.white,
                        ),
                        Text(
                          'Copy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () async {
                      await Share.share(widget.link);
                    },
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.share,
                          color: Colors.white,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () async {
                      await linkDataBox.add({'link': widget.link});

                      final snackBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Details Saved'),
                        action: SnackBarAction(
                          onPressed: () {},
                          label: 'Done',
                        ),
                      );
                      widget.bottomSheetScaffoldKey.currentState
                          .showSnackBar(snackBar);

                      print(linkDataBox.getAt(1));
                    },
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.save,
                          color: Colors.white,
                        ),
                        Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
