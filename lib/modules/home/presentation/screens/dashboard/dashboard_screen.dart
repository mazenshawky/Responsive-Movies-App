import 'package:flutter/material.dart';
import 'package:responsive_movies_app/app/app_prefs.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/mobile_dashboard_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/tablet_dashboard_screen.dart';
import 'package:responsive_movies_app/app/injection_container.dart' as di;

class DashboardScreen extends StatelessWidget {
  final AppPreferences _appPreferences = di.sl<AppPreferences>();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: MobileDashboardScreen(
        appPreferences: _appPreferences,
      ),
      tabletLayout: TabletDashboardScreen(
        appPreferences: _appPreferences,
      ),
    );
  }
}
