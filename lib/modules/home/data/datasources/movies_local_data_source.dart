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
    final jsonString = sharedPreferences.getString(AppStrings.cachedMovies);

    if (jsonString != null) {
      final cacheMovies = Future.value(List<MovieModel>.from(
          (jsonString as List).map((jsonTitle) =>
              Future.value(MovieModel.fromJson(json.decode(jsonTitle))))));

      return cacheMovies;
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> cacheMovies(List<MovieModel> movies) {
    return sharedPreferences.setString(
        AppStrings.cachedMovies, json.encode(movies));
  }
}
