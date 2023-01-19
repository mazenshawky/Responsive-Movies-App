import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/mobile_dashboard_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/tablet_dashboard_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: MobileDashboardScreen(),
      tabletLayout: TabletDashboardScreen(),
    );
  }
}
