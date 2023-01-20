import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_form.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_image.dart';

class TabletLoginScreen extends StatelessWidget {
  const TabletLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          const Expanded(
            child: AuthImage(
              title: AppStrings.login,
              image: IconAssets.loginIcon,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: AppSize.s450,
                  child: AuthForm(label: AppStrings.login),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
