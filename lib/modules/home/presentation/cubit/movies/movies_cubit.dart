// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:responsive_movies_app/core/usecases/base_usecase.dart';
import 'package:responsive_movies_app/core/utils/constants.dart';
import 'package:responsive_movies_app/modules/home/domain/entities/movie.dart';
import 'package:responsive_movies_app/modules/home/domain/usecases/get_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;

  MoviesCubit({required this.getMoviesUseCase}) : super(MoviesInitial());

  Future<void> getMovies() async {
    emit(MoviesLoading());
    Either<Failure, List<Movie>> response =
        await getMoviesUseCase(const NoParameters());

    emit(response.fold(
      (failure) => MoviesError(msg: Constants.mapFailureToMsg(failure)),
      (movies) => MoviesSuccess(movies: movies),
    ));
  }
}
