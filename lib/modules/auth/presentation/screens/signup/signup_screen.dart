import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_background.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/signup/mobile_signup_screen.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/signup/tablet_signup_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackground(
        topImage: ImageAssets.signupTop,
        bottomImage: ImageAssets.signupBottom,
        login: false,
        child: ResponsiveLayout(
          mobileLayout: MobileSignUpScreen(),
          tabletLayout: TabletSignUpScreen(),
        ),
      ),
    );
  }
}
