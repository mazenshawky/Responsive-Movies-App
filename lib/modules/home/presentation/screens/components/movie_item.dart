import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/api/end_points.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/home/domain/entities/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(AppSize.s30),
      child: Column(
        children: [
          Container(
            height: AppSize.s200,
            width: AppSize.s154,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(EndPoints.imageUrl(movie.backdropPath)),
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Text(
            movie.title,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
