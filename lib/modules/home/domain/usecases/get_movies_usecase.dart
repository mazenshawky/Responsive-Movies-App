import 'package:dartz/dartz.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:responsive_movies_app/core/usecases/base_usecase.dart';
import 'package:responsive_movies_app/modules/home/domain/entities/movie.dart';
import 'package:responsive_movies_app/modules/home/domain/repository/movies_repository.dart';

class GetMoviesUseCase implements BaseUseCase<List<Movie>, NoParameters> {
  final MoviesRepository moviesRepository;

  GetMoviesUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parametersa) async {
    return await moviesRepository.getMovies();
  }
}
