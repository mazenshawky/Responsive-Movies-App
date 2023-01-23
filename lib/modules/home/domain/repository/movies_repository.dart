import 'package:dartz/dartz.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:responsive_movies_app/modules/home/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getMovies();
}
