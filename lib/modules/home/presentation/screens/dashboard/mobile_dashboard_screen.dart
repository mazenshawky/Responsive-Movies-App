import 'package:flutter/material.dart';
import 'package:responsive_movies_app/app/app_prefs.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';

class MobileDashboardScreen extends StatelessWidget {
  final AppPreferences appPreferences;

  const MobileDashboardScreen({super.key, required this.appPreferences});

  void _logout(BuildContext context) {
    appPreferences.logout();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => _logout(context), child: const Text('Logout')),
      ),
    );
  }
}
