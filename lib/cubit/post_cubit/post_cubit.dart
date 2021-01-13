import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_clean/model/post_model.dart';
import 'package:sqlite_clean/repository/database/post_db_repo.dart';
import 'package:sqlite_clean/repository/http/post_http_repo.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostsHttpRepo _postsHttpRepo = PostsHttpRepo();
  PostsDbRepo _postsDbRepo = PostsDbRepo();
  PostCubit() : super(PostInitial());

  Future<void> fetchArticles() async {
    try {
      Post post = await _postsHttpRepo.getHttpPost();
      if (post != null) {
        List<Article> articles = post.articles;
        emit(PostLoaded(
          articles: articles,
          message: "",
        ));
      }
    } on SocketException {
      emit(PostError("is your device online"));
    } catch (e) {
      emit(PostError(e));
    }
  }

  Future<void> favouriteArticle(Article article) async {
    final currentState = state;
    if (currentState is PostLoaded) {
      try {
        // add to db
        int id = await _postsDbRepo.addArticle(article);
        debugPrint("Id: $id");

        if (id != null) {
          // if no error
          emit(PostLoaded(
            articles: currentState.articles,
            message: "Saved successfully",
          ));
        } else {
          // if error
          emit(PostLoaded(
            articles: currentState.articles,
            message: "Unable to save your article",
          ));
        }
      } catch (e) {
        emit(PostLoaded(
          articles: currentState.articles,
          message: "$e",
        ));
      }
    }
  }
}
