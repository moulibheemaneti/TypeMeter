import 'package:flutter/material.dart';
import 'package:get/get.dart';

String correct = "correct";
String wrong = "wrong";
String totalCharacters = "total_characters";
String typedCharacters = "typed_characters";

class TypeSpeedController extends GetxController {
  String textToType =
      "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase.";

  var textController = TextEditingController();

  final _hasGameStarted = false.obs;
  bool get hasGameStarted => _hasGameStarted.value;
  set hasGameStarted(bool val) {
    _hasGameStarted.value = val;
  }

  final _isTextFieldEnabled = false.obs;
  bool get isTextFieldEnabled => _isTextFieldEnabled.value;
  set isTextFieldEnabled(bool val) {
    _isTextFieldEnabled.value = val;
  }

  final _showStats = false.obs;
  bool get showStats => _showStats.value;
  set showStats(bool val) {
    _showStats.value = val;
  }

  final stats = {
    correct: 0,
    wrong: 0,
    totalCharacters: 0,
    typedCharacters: 0,
  };

  void onEndGameTapped() {
    isTextFieldEnabled = false;
    var textToConsider = textController.text;

    int num = textToConsider.length < textToType.length
        ? textToConsider.length
        : textToType.length;

    for (int i = 0; i < num; i++) {
      if (textToConsider[i] == textToType[i]) {
        stats[correct] = stats[correct]! + 1;
      } else {
        stats[wrong] = stats[wrong]! + 1;
      }
    }

    stats[totalCharacters] = textToType.length;
    stats[typedCharacters] = textToConsider.length;

    showStats = true;
  }

  void statsReset() {
    stats[correct] = 0;
    stats[wrong] = 0;
    stats[totalCharacters] = 0;
    stats[typedCharacters] = 0;
  }

  void onResetGameTapped() {
    isTextFieldEnabled = false;
    hasGameStarted = false;
    showStats = false;
    statsReset();
  }
}
