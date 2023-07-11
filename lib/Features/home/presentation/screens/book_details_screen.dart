import 'package:book_app/Features/home/presentation/widgets/book_details_screen_body.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BookDetailsScreenBody(),
      ),
    );
  }
}
