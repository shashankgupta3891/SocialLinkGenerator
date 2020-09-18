import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:whatsappshare/provider/carbonCopyListProvider.dart';
import 'package:whatsappshare/screens/emailLinkScreen.dart';
import 'package:whatsappshare/screens/fbMessengerLinkScreen.dart';
import 'package:whatsappshare/screens/savedLinksScreen.dart';
import 'package:whatsappshare/screens/whatsappLinkScreen.dart';

import 'screens/mainHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..openBox<Map>('whatsapp')
    ..openBox<Map>('fbMessenger')
    ..openBox<Map>('email');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Links App',
      theme: ThemeData(
        fontFamily: 'Open_Sans',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainHome(),
        '/whatsapp': (context) => WhatsappLinkScreen(),
        '/fbMessenger': (context) => FbMessengerLinkScreen(),
        '/email': (context) => EmailLinkScreen(),
        '/saved': (context) => SavedLinksScreen(),
      },
    );
  }
}
