import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/modules/auth/data/datasources/auth_local_data_source.dart';

class TabletDashboardScreen extends StatelessWidget {
  final AuthLocalDataSource authLocalDataSource;

  const TabletDashboardScreen({super.key, required this.authLocalDataSource});

  void _logout(BuildContext context) {
    authLocalDataSource.logout();
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
