import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/login/mobile_login_screen.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/login/tablet_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: MobileLoginScreen(),
      tabletLayout: TabletLoginScreen(),
    );
  }
}
