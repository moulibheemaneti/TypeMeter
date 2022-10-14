extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() {
    var res = '';
    trim().split('_').forEach((element) {
      res = '$res${element.capitalize()} ';
    });
    return res.trim();
  }
}
