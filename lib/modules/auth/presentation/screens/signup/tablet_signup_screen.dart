import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_form.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_image.dart';

class TabletSignUpScreen extends StatelessWidget {
  const TabletSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          const Expanded(
            child: AuthImage(
              title: AppStrings.signup,
              image: IconAssets.signupIcon,
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                SizedBox(
                  width: 450,
                  child:
                      AuthForm(isLoginScreen: false, label: AppStrings.signup),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
