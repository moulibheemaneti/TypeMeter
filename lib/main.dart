import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/type_speed/views/type_speed_screen.dart';
import 'routes/routes.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
      home: TypeSpeedScreen(),
    );
  }
}
