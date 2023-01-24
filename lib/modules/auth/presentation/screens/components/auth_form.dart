import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/utils/media_query_values.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/login/login_cubit.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/already_have_an_account_check.dart';

class AuthForm extends StatelessWidget {
  final bool isLoginScreen;
  final String label;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const AuthForm({
    Key? key,
    this.isLoginScreen = true,
    required this.label,
    required this.usernameController,
    required this.passwordController,
    required this.formKey,
  }) : super(key: key);

  void _navigate(BuildContext context) => isLoginScreen
      ? Navigator.of(context).pushNamed(Routes.signupRoute)
      : Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          StreamBuilder<bool>(
            stream: isLoginScreen
                ? BlocProvider.of<LoginCubit>(context).outIsUserNameValid
                : BlocProvider.of<SignUpCubit>(context).outIsUserNameValid,
            builder: (context, snapshot) {
              return TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                cursorColor: AppColors.primaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  hintText: AppStrings.username,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(AppPadding.p16),
                    child: Icon(Icons.person),
                  ),
                  errorText: (snapshot.data ?? true)
                      ? null
                      : AppStrings.invalidUsername,
                ),
              );
            },
          ),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream: isLoginScreen
                ? BlocProvider.of<LoginCubit>(context).outIsPasswordValid
                : BlocProvider.of<SignUpCubit>(context).outIsPasswordValid,
            builder: (context, snapshot) {
              return StreamBuilder<bool>(
                stream: isLoginScreen
                    ? BlocProvider.of<LoginCubit>(context).outIsPasswordVisible
                    : BlocProvider.of<SignUpCubit>(context)
                        .outIsPasswordVisible,
                builder: (context, visibleSnapshot) {
                  return TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: (visibleSnapshot.data ?? true) ? true : false,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: AppStrings.password,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(AppPadding.p16),
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p8),
                        child: GestureDetector(
                          onTap: () {
                            isLoginScreen
                                ? BlocProvider.of<LoginCubit>(context)
                                    .changePasswordVisibility(
                                        (visibleSnapshot.data ?? true))
                                : BlocProvider.of<SignUpCubit>(context)
                                    .changePasswordVisibility(
                                        (visibleSnapshot.data ?? true));
                          },
                          child: (visibleSnapshot.data ?? true)
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.invalidPassword,
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream: isLoginScreen
                ? BlocProvider.of<LoginCubit>(context).outAreAllInputsValid
                : BlocProvider.of<SignUpCubit>(context).outAreAllInputsValid,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: (snapshot.data ?? false)
                    ? () {
                        isLoginScreen
                            ? BlocProvider.of<LoginCubit>(context).login()
                            : BlocProvider.of<SignUpCubit>(context).signup();
                      }
                    : null,
                child: Text(
                  label,
                ),
              );
            },
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
