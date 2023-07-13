import 'package:book_app/Features/home/Data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/business_logic/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Features/home/presentation/widgets/book_details_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsScreen extends StatefulWidget {
   BookDetailsScreen({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}


class _BookDetailsScreenState extends State<BookDetailsScreen> {
@override
void initState(){
  BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: widget.bookModel.volumeInfo.categories![0]);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BookDetailsScreenBody(bookModel: widget.bookModel,),
      ),
    );
  }
}
