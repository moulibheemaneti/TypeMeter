extension IntegerExtension on int {
  int toSeconds() {
    return this % 60;
  }

  int toMinutes() {
    return this ~/ 60;
  }

  String toSecondsString() {
    return "${this % 60}".padLeft(2, '0');
  }

  String toMinutesString() {
    return "${this ~/ 60}".padLeft(2, '0');
  }
}
