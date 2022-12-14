import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extensions/integer_extensions.dart';
import '../../../theme/color_palette.dart';
import '../../../widgets/counter_container.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_drawer.dart';
import '../../../widgets/type_speed_report.dart';
import '../controller/type_speed_controller.dart';

class TypeSpeedScreen extends StatelessWidget {
  TypeSpeedScreen({super.key});

  final typeSpeedController = Get.put(TypeSpeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Type Speed'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ColorPalette.orange,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Text to Type",
                      style: Get.textTheme.headline5?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      typeSpeedController.textToType,
                      style: Get.textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Obx(() {
                if (typeSpeedController.hasGameStarted) {
                  return TextField(
                    autofocus: true,
                    enabled: typeSpeedController.isTextFieldEnabled,
                    decoration: InputDecoration(
                      hintText: 'Type some text...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.yellow,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.yellow,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.orange,
                        ),
                      ),
                    ),
                    maxLines: null,
                    controller: typeSpeedController.textController,
                    onChanged: (val) {},
                  );
                } else {
                  return ElevatedButton(
                    onPressed: typeSpeedController.onStartGameTapped,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorPalette.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Start Game"),
                  );
                }
              }),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: typeSpeedController.onEndGameTapped,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ColorPalette.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text("End Game"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: typeSpeedController.onResetGameTapped,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ColorPalette.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Reset Game"),
              ),
              const SizedBox(height: 16),
              Obx(() {
                if (typeSpeedController.showStats) {
                  return TypeSpeedReport(dataMap: typeSpeedController.stats);
                } else {
                  return Row(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return CounterContainer(
                            title: "Minutes Elapsed",
                            counter: typeSpeedController.secondsElapsed
                                .toMinutesString(),
                          );
                        }),
                      ),
                      SizedBox(width: Get.size.width * 0.05),
                      Expanded(
                        child: Obx(() {
                          return CounterContainer(
                            title: "Seconds Elapsed",
                            counter: typeSpeedController.secondsElapsed
                                .toSecondsString(),
                          );
                        }),
                      ),
                    ],
                  );
                  // return Text(
                  //     "Seconds Elapsed: ${typeSpeedController.secondsElapsed}");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
