import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:type_meter/theme/color_palette.dart';

void showSnackBar(String title, String description) {
  Get.closeAllSnackbars();
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: description,
    ),
  );
}

void showOkDialog({String? title, String? description}) {
  if (Get.isDialogOpen != null && Get.isDialogOpen!) Get.back();
  showDialog(
    context: Get.context!,
    builder: (ctx) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? 'Title',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                description ?? "Description",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ColorPalette.yellow,
                  foregroundColor: Colors.white,
                ),
                child: const Text("OK"),
              )
            ],
          ),
        ),
      );
    },
  );
}
