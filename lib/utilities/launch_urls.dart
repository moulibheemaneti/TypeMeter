import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'snackbars.dart';

/// Launch the external url.
///
/// This handles any exceptions raised when an url is launched.
void launchExternalUrl(String externalLink) async {
  var urlLink = Uri.parse(externalLink);
  var isLaunchable = await canLaunchUrl(urlLink);
  try {
    if (isLaunchable) {
      await launchUrl(urlLink);
    }
  } catch (e) {
    debugPrint("$e");
    showOkDialog(
      title: 'Error',
      description: "Can't open website right now. Please check later.",
    );
  }
}
