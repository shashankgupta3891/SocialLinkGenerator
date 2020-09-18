import 'package:flutter/material.dart';
import 'screens/fbMessengerLinkScreen.dart';
import 'screens/emailLinkScreen.dart';
import 'screens/whatsappLinkScreen.dart';

class GlobalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Messenger"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => FbMessengerLinkScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Email"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EmailLinkScreen()));
            },
          ),
          ListTile(
            title: Text("Whatsapp"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => WhatsappLinkScreen()));
            },
          ),
        ],
      ),
    );
  }
}
