import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
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

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: MobileMoviesScreen(),
      tabletLayout: TabletMoviesScreen(),
    );
  }
}
