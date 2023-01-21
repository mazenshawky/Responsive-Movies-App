import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/modules/auth/data/datasources/auth_local_data_source.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/mobile_dashboard_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/tablet_dashboard_screen.dart';
import 'package:responsive_movies_app/app/injection_container.dart' as di;

class DashboardScreen extends StatelessWidget {
  final AuthLocalDataSource _authLocalDataSource = di.sl<AuthLocalDataSource>();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: MobileDashboardScreen(
        authLocalDataSource: _authLocalDataSource,
      ),
      tabletLayout: TabletDashboardScreen(
        authLocalDataSource: _authLocalDataSource,
      ),
    );
  }
}
