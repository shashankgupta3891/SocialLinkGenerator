import 'package:flutter/material.dart';

import 'mainHome.dart';

void main() => runApp(MyApp());

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
      home: MainHome(),
    );
  }
}
