import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:type_meter/extensions/integer_extensions.dart';

String correct = "correct";
String wrong = "wrong";
String totalCharacters = "total_characters";
String typedCharacters = "typed_characters";
String timeTaken = "time_taken";
String wordsPerMinute = "words_per_minute";
String accuracy = "accuracy";

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
    timeTaken: "0",
    accuracy: "0 %",
    wordsPerMinute: 0,
  };

  final _secondsElapsed = 0.obs;
  int get secondsElapsed => _secondsElapsed.value;
  set secondsElapsed(int val) {
    _secondsElapsed.value = val;
  }

  void onStartGameTapped() {
    hasGameStarted = true;
    isTextFieldEnabled = true;
    secondsElapsed = 0;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!hasGameStarted) {
          timer.cancel();
          return;
        }
        secondsElapsed += 1;
      },
    );
    showStats = false;
  }

  void onEndGameTapped() {
    isTextFieldEnabled = false;
    var textToConsider = textController.text;

    int num = textToConsider.length < textToType.length
        ? textToConsider.length
        : textToType.length;

    for (int i = 0; i < num; i++) {
      if (textToConsider[i] == textToType[i]) {
        stats[correct] = (stats[correct] as int) + 1;
      } else {
        stats[wrong] = (stats[wrong] as int) + 1;
      }
    }

    stats[totalCharacters] = textToType.length;
    stats[typedCharacters] = textToConsider.length;
    stats[timeTaken] =
        "${secondsElapsed.toMinutesString()}:${secondsElapsed.toSecondsString()}";
    stats[accuracy] =
        "${(((stats[correct] as int) / textToType.length) * 100).toPrecision(2)} %";

    stats[wordsPerMinute] = calculateWPM(textToType.length, secondsElapsed);
    showStats = true;
  }

  int calculateWPM(int charactersEntered, int timeTaken) {
    return (charactersEntered / 5) ~/ timeTaken;
  }

  void statsReset() {
    stats[correct] = 0;
    stats[wrong] = 0;
    stats[totalCharacters] = 0;
    stats[typedCharacters] = 0;
    stats[timeTaken] = 0;
  }

  void onResetGameTapped() {
    isTextFieldEnabled = false;
    hasGameStarted = false;
    showStats = false;
    statsReset();
    secondsElapsed = 0;
    textController.clear();
  }
}
