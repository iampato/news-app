part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final List<Article> articles;

  FavouriteSuccess(this.articles);

  @override
  List<Object> get props => [articles];
}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);

  @override
  List<Object> get props => [message];
}
