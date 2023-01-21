import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_background.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/signup/mobile_signup_screen.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/signup/tablet_signup_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _signupUsernameController =
      TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();

  _bind() {
    _signupUsernameController.addListener(() =>
        BlocProvider.of<SignUpCubit>(context)
            .setUserName(_signupUsernameController.text));
    _signupPasswordController.addListener(() =>
        BlocProvider.of<SignUpCubit>(context)
            .setPassword(_signupPasswordController.text));

    BlocProvider.of<SignUpCubit>(context)
        .isUserSignedUpSuccessfullyStreamController
        .stream
        .listen((isSignedUp) {
      if (isSignedUp) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(Routes.dashboardRoute);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        topImage: ImageAssets.signupTop,
        bottomImage: ImageAssets.signupBottom,
        login: false,
        child: ResponsiveLayout(
          mobileLayout: MobileSignUpScreen(
            signupUsernameController: _signupUsernameController,
            signupPasswordController: _signupPasswordController,
            signupFormKey: _signupFormKey,
          ),
          tabletLayout: TabletSignUpScreen(
            signupUsernameController: _signupUsernameController,
            signupPasswordController: _signupPasswordController,
            signupFormKey: _signupFormKey,
          ),
        ),
      ),
    );
  }
}
