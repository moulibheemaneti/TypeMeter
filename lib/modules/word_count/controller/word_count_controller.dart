import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controls the logic in word counting screen.
class WordCountController extends GetxController {
  /// Text controller to handle the text in the textfield.
  TextEditingController textController = TextEditingController();

  /// Final text is the text in textfield.
  final _finalText = ''.obs;
  String get finalText => _finalText.value;
  set finalText(String val) => _finalText.value = val;

  /// Number of characters present in the string present in the text field.
  final _characterCount = 0.obs;
  int get characterCount => _characterCount.value;
  set characterCount(int val) => _characterCount.value = val;

  /// Number of words present in the string present in the text field.
  final _wordCount = 0.obs;
  int get wordCount => _wordCount.value;
  set wordCount(int val) => _wordCount.value = val;

  /// Update the number of characters to be displayed in the counter container.
  void updateCharacterCount() {
    if (finalText.isEmpty || finalText.trim().isEmpty) {
      characterCount = 0;
      return;
    }
    var temp = finalText.trim().length;
    characterCount = temp;
  }

  /// Update the number of words to be displayed in the counter container.
  void updateWordCount() {
    if (finalText.isEmpty || finalText.trim().isEmpty) {
      wordCount = 0;
      return;
    }
    var nextLineTemp = finalText.trim().split("\n");
    int tempCount = 0;
    for (var line in nextLineTemp) {
      var temp = line.trim().split(" ");
      temp.removeWhere((element) => element == "");
      temp.removeWhere((element) => element == " ");
      tempCount = tempCount + temp.length;
    }
    // wordCount = temp.length;
    wordCount = tempCount;
  }

  /// To clear the text field and reset the counters.
  void resetText() {
    textController.clear();
    finalText = '';
    characterCount = 0;
    wordCount = 0;
    Get.focusScope?.unfocus();
  }
}
