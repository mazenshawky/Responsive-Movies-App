import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_movies_app/app/app_prefs.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/utils/media_query_values.dart';
import 'package:responsive_movies_app/app/injection_container.dart' as di;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  final AppPreferences _appPreferences = di.sl<AppPreferences>();

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _goNext() async {
    _appPreferences.getIsUserLoggedIn().then(
          (isUserLoggedIn) => {
            if (isUserLoggedIn)
              {Navigator.pushReplacementNamed(context, Routes.dashboardRoute)}
            else
              {Navigator.pushReplacementNamed(context, Routes.loginRoute)}
          },
        );
  }

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      body: Center(
          child: Icon(
        Icons.movie,
        color: AppColors.primaryColor,
        size: context.width * AppSize.s0_6_5,
      )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
