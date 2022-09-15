import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/word_count/views/word_count_view.dart';

/// Entry point of the app.
void main() {
  // Run the root class here.
  runApp(const MyApp());
}

/// Root class of the app.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Type Meter',
      home: WordCountPage(),
    );
  }
}
