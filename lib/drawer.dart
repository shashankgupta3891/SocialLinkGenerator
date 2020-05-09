import 'package:flutter/material.dart';
import 'screens/messenger.dart';
import 'screens/email.dart';
import 'screens/whatsapp.dart';

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
                  builder: (BuildContext context) => MessengerLink(),
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
                      builder: (BuildContext context) => EmailLink()));
            },
          ),
          ListTile(
            title: Text("Whatsapp"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Whatsapp()));
            },
          ),
        ],
      ),
    );
  }
}
