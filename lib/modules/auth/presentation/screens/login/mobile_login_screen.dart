import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_form.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_image.dart';

class MobileLoginScreen extends StatelessWidget {
  final TextEditingController loginUsernameController;
  final TextEditingController loginPasswordController;
  final GlobalKey<FormState> loginFormKey;
  final Widget buildBloc;

  const MobileLoginScreen({
    super.key,
    required this.loginUsernameController,
    required this.loginPasswordController,
    required this.loginFormKey,
    required this.buildBloc,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthImage(
              title: AppStrings.login,
              image: IconAssets.loginIcon,
            ),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: AppSize.s8,
                  child: AuthForm(
                    label: AppStrings.login,
                    usernameController: loginUsernameController,
                    passwordController: loginPasswordController,
                    formKey: loginFormKey,
                  ),
                ),
                const Spacer(),
              ],
            ),
            buildBloc,
          ],
        ),
      ),
    );
  }
}
