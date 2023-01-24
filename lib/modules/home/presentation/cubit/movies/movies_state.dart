part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<Movie> movies;

  const MoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MoviesError extends MoviesState {
  final String msg;

  const MoviesError({required this.msg});

  @override
  List<Object> get props => [msg];
}
