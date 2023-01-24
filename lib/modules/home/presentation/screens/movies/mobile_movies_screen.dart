import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/home/domain/entities/movie.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/components/movie_item.dart';

class MobileMoviesScreen extends StatelessWidget {
  final List<Movie> movies;

  const MobileMoviesScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: AppSize.s1 / AppSize.s1_3_5,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              movies.length,
              (index) => MovieItem(movie: movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}
