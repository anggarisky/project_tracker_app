import 'package:flutter/material.dart';
import 'package:trello_like_mobile_app/pages/browse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BrowseTask(),
      debugShowCheckedModeBanner: false,
    );
  }
}
