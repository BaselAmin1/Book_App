import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/Data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewsetBooksCubit extends Cubit<NewestBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.featchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}