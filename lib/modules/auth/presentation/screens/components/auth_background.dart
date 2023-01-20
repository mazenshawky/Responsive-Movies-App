import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/utils/media_query_values.dart';

class AuthBackground extends StatelessWidget {
  final bool login;
  final Widget child;
  final String topImage;
  final String bottomImage;

  const AuthBackground({
    Key? key,
    this.login = true,
    required this.child,
    required this.topImage,
    required this.bottomImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: AppSize.s0,
            left: AppSize.s0,
            child: Image.asset(
              topImage,
              width: AppSize.s120,
            ),
          ),
          login
              ? Positioned(
                  bottom: AppSize.s0,
                  right: AppSize.s0,
                  child: Image.asset(
                    bottomImage,
                    width: AppSize.s120,
                  ),
                )
              : Positioned(
                  bottom: AppSize.s0,
                  left: AppSize.s0,
                  child: Image.asset(
                    bottomImage,
                    width: AppSize.s120,
                  ),
                ),
          child,
        ],
      ),
    );
  }
}
