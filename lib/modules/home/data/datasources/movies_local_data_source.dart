import 'dart:convert';

import 'package:responsive_movies_app/core/error/cache_exceptions.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/modules/home/data/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MoviesLocalDataSource {
  Future<List<MovieModel>> getLastMovies();
  Future<void> cacheMovies(List<MovieModel> movies);
}

class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  final SharedPreferences sharedPreferences;

  MoviesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<MovieModel>> getLastMovies() {
    final jsonMovies =
        sharedPreferences.getStringList(AppStrings.cachedMoviesKey);

    if (jsonMovies != null) {
      final cachedMovies = Future.value(List<MovieModel>.from((jsonMovies)
          .map((jsonMovie) => MovieModel.fromJson(json.decode(jsonMovie)))));

      return cachedMovies;
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> cacheMovies(List<MovieModel> movies) {
    final List<String> jsonMovies = [];
    for (var movie in movies) {
      jsonMovies.add(json.encode(movie));
    }
    return sharedPreferences.setStringList(
        AppStrings.cachedMoviesKey, jsonMovies);
  }
}
