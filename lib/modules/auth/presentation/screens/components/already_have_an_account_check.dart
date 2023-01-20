import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool isLoginScreen;
  final VoidCallback press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.isLoginScreen = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginScreen ? AppStrings.noAccount : AppStrings.haveAnAccount,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            isLoginScreen ? AppStrings.signupCheck : AppStrings.signinCheck,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
