import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_form.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_image.dart';

class TabletLoginScreen extends StatelessWidget {
  final TextEditingController loginUsernameController;
  final TextEditingController loginPasswordController;
  final GlobalKey<FormState> loginFormKey;

  const TabletLoginScreen({
    super.key,
    required this.loginUsernameController,
    required this.loginPasswordController,
    required this.loginFormKey,
  });

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p16),
                  child: SizedBox(
                    width: AppSize.s450,
                    child: AuthForm(
                      label: AppStrings.login,
                      usernameController: loginUsernameController,
                      passwordController: loginPasswordController,
                      formKey: loginFormKey,
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
