import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqlite_clean/model/post_model.dart';
import 'package:sqlite_clean/repository/database/post_db_repo.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  PostsDbRepo _postsDbRepo = PostsDbRepo();

  FavouriteCubit() : super(FavouriteInitial());

  Future<void> fetchSavedArticles() async {
    try {
      List<Article> _articles = await _postsDbRepo.getAllArticles();
      emit(FavouriteSuccess(_articles ?? []));
    } on SocketException {
      emit(FavouriteError("is your device online"));
    } catch (e) {
      emit(FavouriteError(e.toString()));
    }
  }
}
