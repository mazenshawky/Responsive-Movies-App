import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';

class NavigateAndLogoutButtons extends StatelessWidget {
  final VoidCallback? logout;
  const NavigateAndLogoutButtons({super.key, required this.logout});

  _goToMovies(BuildContext context) =>
      Navigator.of(context).pushNamed(Routes.moviesRoute);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _goToMovies(context),
          child: const Text(
            AppStrings.goToMovies,
          ),
        ),
        const SizedBox(height: AppSize.s16),
        ElevatedButton(
          onPressed: () {
            if (logout != null) {
              logout!();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryLightColor,
            elevation: AppSize.s0,
          ),
          child: const Text(
            AppStrings.logout,
            style: TextStyle(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
