import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';

class StateErrorButton extends StatelessWidget {
  const StateErrorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p90, vertical: AppPadding.p15),
      child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(AppStrings.tryAgain)),
    );
  }
}
