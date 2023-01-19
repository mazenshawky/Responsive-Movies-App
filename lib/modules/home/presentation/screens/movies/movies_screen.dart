import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/movies/mobile_movies_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/movies/tablet_movies_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: MobileMoviesScreen(),
      tabletLayout: TabletMoviesScreen(),
    );
  }
}
