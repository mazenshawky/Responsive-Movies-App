import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/widgets/screen_image.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_form.dart';

class TabletSignUpScreen extends StatelessWidget {
  final TextEditingController signupUsernameController;
  final TextEditingController signupPasswordController;
  final GlobalKey<FormState> signupFormKey;
  final Widget buildBloc;

  const TabletSignUpScreen({
    super.key,
    required this.signupUsernameController,
    required this.signupPasswordController,
    required this.signupFormKey,
    required this.buildBloc,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          const Expanded(
            child: ScreenImage(
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
          buildBloc,
        ],
      ),
    );
  }
}
