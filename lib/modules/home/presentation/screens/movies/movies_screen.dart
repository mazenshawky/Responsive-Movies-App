import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/widgets/state_animation_image.dart';
import 'package:responsive_movies_app/core/widgets/state_error_text.dart';
import 'package:responsive_movies_app/modules/home/presentation/cubit/movies/movies_cubit.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/movies/mobile_movies_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/movies/tablet_movies_screen.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  void _getMovies() => BlocProvider.of<MoviesCubit>(context).getMovies();

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
      if (state is MoviesLoading) {
        return const StateAnimationImage(animationImage: JsonAssets.loading);
      } else if (state is MoviesError) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StateAnimationImage(animationImage: JsonAssets.error),
            StateErrorText(text: (state).msg),
          ],
        );
      } else if (state is MoviesSuccess) {
        return ResponsiveLayout(
          mobileLayout: MobileMoviesScreen(
            movies: (state.movies),
          ),
          tabletLayout: TabletMoviesScreen(
            movies: (state.movies),
          ),
        );
      } else {
        return const StateAnimationImage(animationImage: JsonAssets.loading);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      body: SafeArea(child: _buildBodyContent()),
    );
  }
}
