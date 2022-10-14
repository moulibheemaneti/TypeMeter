import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/about_screen.dart';
import '../modules/not_found_screen.dart';
import '../modules/type_speed/views/type_speed_screen.dart';
import '../modules/word_count/views/word_count_screen.dart';
import '../routes/pages.dart';

/// `RouteGenerator` is a class that generates routes for the application.
class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case Routes.about:
        return GetPageRoute(
          routeName: Routes.about,
          page: () => const AboutScreen(),
          settings: settings,
        );
      case Routes.wordCountPage:
        return GetPageRoute(
          routeName: Routes.wordCountPage,
          page: () => WordCountPage(),
          settings: settings,
        );
      case Routes.typeSpeed:
        return GetPageRoute(
          routeName: Routes.typeSpeed,
          page: () => TypeSpeedScreen(),
          settings: settings,
        );

      default:
        return GetPageRoute(
          page: () => const NotFoundScreen(),
        );
    }
  }
}
