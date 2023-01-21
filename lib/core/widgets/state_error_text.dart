import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';

class StateErrorText extends StatelessWidget {
  final String text;

  const StateErrorText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p15),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
