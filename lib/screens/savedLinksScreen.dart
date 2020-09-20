import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:share/share.dart';

class SavedLinksScreen extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'whatsapp'),
    Tab(text: 'fbMessenger'),
    Tab(text: 'email'),
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        key: scaffoldKey,
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
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Saved Links',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: myTabs,
            indicator: MD2Indicator(
              //it begins here
              indicatorHeight: 3,
              indicatorColor: Color(0xff1a73e8),
              indicatorSize: MD2IndicatorSize.normal,
            ),
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            final String boxName = tab.text;
            print(boxName);

            Box box = Hive.box<Map>(boxName);

            return ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box box, _) {
                List<Map> links = box.values.toList();
                print(links);
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    String link = links[index]['link'];
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ExpansionTile(
                          title: Text(link),
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: RaisedButton.icon(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.blue,
                                      icon: Icon(
                                        FontAwesomeIcons.copy,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        'Copy',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        await FlutterClipboard.copy(link);
                                        final snackBar = SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text('Copied to Clipboard'),
                                          action: SnackBarAction(
                                            onPressed: () {},
                                            label: 'Done',
                                          ),
                                        );
                                        scaffoldKey.currentState
                                            .showSnackBar(snackBar);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: RaisedButton.icon(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.blue,
                                      icon: Icon(
                                        FontAwesomeIcons.share,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        'Share',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        await Share.share(link);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: RaisedButton.icon(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.red,
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        await box.deleteAt(index);

                                        final snackBar = SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text('Item Deleted'),
                                          action: SnackBarAction(
                                            onPressed: () {},
                                            label: 'Ok',
                                          ),
                                        );
                                        scaffoldKey.currentState
                                            .showSnackBar(snackBar);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
