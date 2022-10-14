import 'package:flutter/material.dart';

import '../extensions/string_extensions.dart';

class TypeSpeedReport extends StatelessWidget {
  const TypeSpeedReport({
    super.key,
    required this.dataMap,
  });
  final Map<String, dynamic> dataMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Your Report"),
        Table(
          children: dataMap.entries.map((e) {
            return TableRow(
              children: [
                TableCell(child: Text(e.key.toTitleCase())),
                TableCell(child: Text("${e.value}")),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
