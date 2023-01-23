import 'package:responsive_movies_app/core/error/cache_exceptions.dart';
import 'package:responsive_movies_app/core/error/server_exceptions.dart';
import 'package:responsive_movies_app/core/network/network_info.dart';
import 'package:responsive_movies_app/modules/home/data/datasources/movies_local_data_source.dart';
import 'package:responsive_movies_app/modules/home/data/datasources/movies_remote_data_source.dart';
import 'package:responsive_movies_app/modules/home/domain/entities/movie.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:responsive_movies_app/modules/home/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final NetworkInfo networkInfo;
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final MoviesLocalDataSource moviesLocalDataSource;

  MoviesRepositoryImpl({
    required this.networkInfo,
    required this.moviesRemoteDataSource,
    required this.moviesLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovies = await moviesRemoteDataSource.getMovies();
        moviesLocalDataSource.cacheMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMovies = await moviesLocalDataSource.getLastMovies();
        return Right(localMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
