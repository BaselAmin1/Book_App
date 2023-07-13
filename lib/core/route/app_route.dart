import 'package:book_app/Features/Splash/presentation/screens/splash_screen.dart';
import 'package:book_app/Features/home/Data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/Data/repos/home_repo_imp.dart';
import 'package:book_app/Features/home/business_logic/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/Features/home/business_logic/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_app/Features/home/business_logic/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Features/home/presentation/screens/book_details_screen.dart';
import 'package:book_app/Features/home/presentation/screens/home_screen.dart';
import 'package:book_app/Features/search/presentation/screens/search_screen.dart';

import 'package:book_app/core/route/route_path.dart';
import 'package:book_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    FeaturedBooksCubit featuredBooksCubit = FeaturedBooksCubit(
      getIt.get<HomeRepoImpl>(),
    );

    NewsetBooksCubit newsetBooksCubit = NewsetBooksCubit(
      getIt.get<HomeRepoImpl>(),
    );

    AppRouter();

    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider<FeaturedBooksCubit>.value(
              value: featuredBooksCubit..fetchFeaturedBooks(),
            ),
            BlocProvider<NewsetBooksCubit>.value(
              value: newsetBooksCubit..fetchNewestBooks(),
            )
          ], child: const HomeScreen()),
        );

      case bookDetailsScreen:
       final bookModel = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SimilarBooksCubit(
              getIt.get<HomeRepoImpl>(),
            ),
            child:  BookDetailsScreen(bookModel: bookModel as BookModel,),
          ),
        );
      case searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
    }
    return null;
  }
}
