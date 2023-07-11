import 'package:book_app/Features/Splash/presentation/screens/splash_screen.dart';
import 'package:book_app/Features/home/presentation/screens/book_details_screen.dart';
import 'package:book_app/Features/home/presentation/screens/home_screen.dart';
import 'package:book_app/Features/search/presentation/screens/search_screen.dart';

import 'package:book_app/core/route/route_path.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    AppRouter();

    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case bookDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const BookDetailsScreen(),
        );
      case searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
    }
    return null;
  }
}
