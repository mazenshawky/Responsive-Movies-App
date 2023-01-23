import 'package:responsive_movies_app/core/api/api_consumer.dart';
import 'package:responsive_movies_app/core/api/end_points.dart';
import 'package:responsive_movies_app/modules/home/data/models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  ApiConsumer apiConsumer;

  MoviesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<MovieModel>> getMovies() async {
    final response = await apiConsumer.get(
      EndPoints.moviesPath,
    );
    return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
  }
}
