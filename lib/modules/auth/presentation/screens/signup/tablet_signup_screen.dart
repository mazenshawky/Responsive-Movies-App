import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_form.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_image.dart';

class TabletSignUpScreen extends StatelessWidget {
  final TextEditingController signupUsernameController;
  final TextEditingController signupPasswordController;
  final GlobalKey<FormState> signupFormKey;

  const TabletSignUpScreen({
    super.key,
    required this.signupUsernameController,
    required this.signupPasswordController,
    required this.signupFormKey,
  });

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
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p16),
                  child: SizedBox(
                    width: AppSize.s450,
                    child: AuthForm(
                      isLoginScreen: false,
                      label: AppStrings.signup,
                      usernameController: signupUsernameController,
                      passwordController: signupPasswordController,
                      formKey: signupFormKey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
