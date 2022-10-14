import 'package:flutter/material.dart';
import 'package:type_meter/theme/color_palette.dart';

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
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Your Report",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: ColorPalette.orange,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Table(
          children: dataMap.entries.map((e) {
            return TableRow(
              children: [
                TableCell(
                  child: Text(
                    e.key.toTitleCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TableCell(
                  child: Text(
                    "${e.value}",
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
