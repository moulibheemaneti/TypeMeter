import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_palette.dart';
import '../../../widgets/counter_container.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_drawer.dart';
import '../controller/word_count_controller.dart';

/// Word count page of the app. It displays number of characters
/// and number of words present in the textfield.
class WordCountPage extends StatelessWidget {
  WordCountPage({Key? key}) : super(key: key);

  /// Getting the [WordCountController] instance
  final wordCountController = Get.put(WordCountController());

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = mq.size;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: "Word Count"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16,
          ),
          child: GestureDetector(
            onTap: () => Get.focusScope?.unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return CounterContainer(
                            title: "Character Count",
                            counter: "${wordCountController.characterCount}");
                      }),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      child: Obx(() {
                        return CounterContainer(
                          title: "Word Count",
                          counter: "${wordCountController.wordCount}",
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                TextField(
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
                        color: ColorPalette.darkYellow,
                      ),
                    ),
                  ),
                  maxLines: null,
                  controller: wordCountController.textController,
                  onChanged: (val) {
                    wordCountController.finalText = val;
                    wordCountController.updateCharacterCount();
                    wordCountController.updateWordCount();
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: wordCountController.resetText,
                  child: const Text(
                    "Clear Text",
                    style: TextStyle(
                      color: ColorPalette.darkYellow,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
