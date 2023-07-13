import 'package:book_app/constants.dart';
import 'package:book_app/core/route/app_route.dart';
import 'package:book_app/core/route/route_path.dart';
import 'package:book_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(Bookly(
    appRouter: AppRouter(),
  ));
}

class Bookly extends StatelessWidget {
  final AppRouter appRouter;
  const Bookly({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: splashScreen,
    );
  }
}
