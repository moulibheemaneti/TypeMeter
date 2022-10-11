import 'package:flutter/material.dart';
import 'package:type_meter/theme/color_palette.dart';

/// Counter Container has a title with the small text size and
/// counter value in bold font to emphasize the count value of a particular attribute.
class CounterContainer extends StatelessWidget {
  const CounterContainer({
    Key? key,
    required this.title,
    required this.counter,
  }) : super(key: key);

  /// Title is displayed at the top of the container.
  final String title;

  /// Counter is show boldly below the title.
  final String counter;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = mq.size;
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: ColorPalette.yellow,
        border: Border.all(
          color: ColorPalette.darkYellow,
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.035,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            // Counter
            Text(
              counter,
              style: TextStyle(
                fontSize: size.width * 0.09,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
