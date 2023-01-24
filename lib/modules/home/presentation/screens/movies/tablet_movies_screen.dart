import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/home/domain/entities/movie.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/components/movie_item.dart';

class TabletMoviesScreen extends StatelessWidget {
  final List<Movie> movies;

  const TabletMoviesScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                movies.length,
                (index) => MovieItem(movie: movies[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
