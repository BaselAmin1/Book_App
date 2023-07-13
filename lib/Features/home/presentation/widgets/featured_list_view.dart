import 'package:book_app/Features/home/business_logic/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/core/route/route_path.dart';
import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
       if(state is FeaturedBooksSuccess){
         return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector( onTap: ()=> Navigator.pushReplacementNamed(context, bookDetailsScreen,arguments: state.books[index]),
                    child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks!.thumbnail!,)),
                );
              }),
        );
       }else if (state is FeaturedBooksFailure){
       return CustomErrorWidget(errMessage: state.errMessage);
       }else{
       return const CustomLoadingIndicator();
       }
      },
    );
  }
}
