import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/pages.dart';
import '../theme/color_palette.dart';
import '../utilities/constant_links.dart';
import '../utilities/launch_urls.dart';

/// Drawer for the application
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset('assets/logo.png'),
          ),
          _listTile(title: 'About The App', route: Routes.about),
          _listTile(title: 'Word Count', route: Routes.wordCountPage),
          _listTile(title: 'Type Speed', route: Routes.typeSpeed),
          _listTile(
            title: 'Privacy Policy',
            externalLink: typeMeterPrivacyPolicy,
          ),
        ],
      ),
    );
  }

  void checkRoute(String route) {
    if (Get.currentRoute == route) {
      Get.back();
    } else {
      Get.toNamed(route);
    }
  }

  Widget _listTile({
    required String title,
    String? route,
    String? externalLink,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: ColorPalette.orange,
        ),
      ),
      onTap: () async {
        if (route != null) {
          checkRoute(route);
        } else {
          if (externalLink != null) {
            launchExternalUrl(externalLink);
          }
        }
      },
    );
  }
}
