part of 'post_cubit.dart';

@immutable
abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<Article> articles;
  final String message;

  PostLoaded({this.articles, this.message});
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}
