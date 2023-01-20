import 'package:flutter/material.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/utils/media_query_values.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/already_have_an_account_check.dart';

class AuthForm extends StatelessWidget {
  final bool isLoginScreen;
  final String label;

  const AuthForm({
    Key? key,
    this.isLoginScreen = true,
    required this.label,
  }) : super(key: key);

  void _navigate(BuildContext context) => isLoginScreen
      ? Navigator.of(context).pushNamed(Routes.signupRoute)
      : Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: AppColors.primaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: AppStrings.username,
              prefixIcon: Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s16),
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              hintText: AppStrings.password,
              prefixIcon: const Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Icon(Icons.lock),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: AppPadding.p8),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_outlined),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s16),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              AppStrings.login,
            ),
          ),
          SizedBox(height: context.height * AppSize.s0_0_3),
          AlreadyHaveAnAccountCheck(
            isLoginScreen: isLoginScreen,
            press: () => _navigate(context),
          ),
        ],
      ),
    );
  }
}
