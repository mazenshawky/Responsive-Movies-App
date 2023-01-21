import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/modules/auth/presentation/common/freezed_data_classes.dart';

class Constants {
  static bool isUsernameValid(String username) => username.length >= 3;

  static bool isPasswordValid(String password) => password.length >= 6;

  static bool areAllLoginInputsValid(LoginObject loginObject) =>
      isUsernameValid(loginObject.username) &&
      isPasswordValid(loginObject.password);

  static bool areAllSignUpInputsValid(SignUpObject signUpObject) =>
      isUsernameValid(signUpObject.username) &&
      isPasswordValid(signUpObject.password);

  static String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      case UsernameAlreadyExistsFailure:
        return AppStrings.usernameAlreadyExistsFailure;
      case UserNotExistsFailure:
        return AppStrings.userNotExistsFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }

  static void showPopupWidget(BuildContext context,
      {required List<Widget> children}) {
    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
