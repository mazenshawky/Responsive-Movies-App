import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';

class ResponsiveMoviesApp extends StatelessWidget {
  const ResponsiveMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
