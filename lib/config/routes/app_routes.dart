import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/login/login_screen.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/signup/signup_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/movies/movies_screen.dart';
import 'package:responsive_movies_app/modules/splash/presentation/screens/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String dashboardRoute = '/dashboard';
  static const String moviesRoute = '/movies';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case Routes.signupRoute:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      case Routes.dashboardRoute:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());

      case Routes.moviesRoute:
        return MaterialPageRoute(builder: (context) => const MoviesScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
