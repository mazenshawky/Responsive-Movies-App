import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';

class TabletSplashScreen extends StatefulWidget {
  const TabletSplashScreen({super.key});

  @override
  State<TabletSplashScreen> createState() => _TabletSplashScreenState();
}

class _TabletSplashScreenState extends State<TabletSplashScreen> {
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.loginRoute);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
