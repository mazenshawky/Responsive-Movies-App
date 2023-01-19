import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/modules/splash/presentation/screens/splash/mobile_splash_screen.dart';
import 'package:responsive_movies_app/modules/splash/presentation/screens/splash/tablet_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: MobileSplashScreen(),
      tabletLayout: TabletSplashScreen(),
    );
  }
}
