import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Page Not Found"),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Text("Go Back"),
        ),
      ],
    ));
  }
}
