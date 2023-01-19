import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/responsive/mobile_layout.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/config/responsive/tablet_layout.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';

class ResponsiveMoviesApp extends StatelessWidget {
  const ResponsiveMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: ResponsiveLayout(
        mobileLayout: MobileLayout(),
        tabletLayout: TabletLayout(),
      ),
    );
  }
}
