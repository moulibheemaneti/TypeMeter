import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:type_meter/widgets/custom_appbar.dart';

import '../../../theme/color_palette.dart';
import '../../../utilities/constant_links.dart';
import '../../../utilities/launch_urls.dart';
import '../../../utilities/tm_icons.dart';
import '../../../widgets/custom_drawer.dart';

const String aboutPara1 = '''
Type Meter is a open source flutter app developed by "Mouli Bheemaneti". This app can be used to count the number of characters in the text.
''';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "About the App",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              aboutPara1,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Developer Card",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _developerCard(),
          ],
        ),
      ),
    );
  }

  Widget _developerCard() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: ColorPalette.yellow,
        border: Border.all(
          color: ColorPalette.orange,
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mouli Bheemaneti",
            style: Get.textTheme.headline5?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  launchExternalUrl(githubLink);
                },
                icon: const Icon(
                  TMIcons.github,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  launchExternalUrl(twitterLink);
                },
                icon: const Icon(
                  TMIcons.twitter,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  launchExternalUrl(linkedInLink);
                },
                icon: const Icon(
                  TMIcons.linkedin,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
