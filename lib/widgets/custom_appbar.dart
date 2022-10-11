import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color_palette.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    String? title,
  }) : super(
          key: key,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: ColorPalette.orange,
          title: Text(title ?? "Type Meter"),
          titleTextStyle: Get.textTheme.headline4?.copyWith(
            color: ColorPalette.orange,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        );
}
