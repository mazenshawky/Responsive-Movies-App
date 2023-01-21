import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/login/login_cubit.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/components/auth_background.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/login/mobile_login_screen.dart';
import 'package:responsive_movies_app/modules/auth/presentation/screens/login/tablet_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginUsernameController =
      TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  _bind() {
    _loginUsernameController.addListener(() =>
        BlocProvider.of<LoginCubit>(context)
            .setUserName(_loginUsernameController.text));
    _loginPasswordController.addListener(() =>
        BlocProvider.of<LoginCubit>(context)
            .setPassword(_loginPasswordController.text));

    BlocProvider.of<LoginCubit>(context)
        .isUserLoggedInSuccessfullyStreamController
        .stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
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
        topImage: ImageAssets.loginTop,
        bottomImage: ImageAssets.loginBottom,
        child: ResponsiveLayout(
          mobileLayout: MobileLoginScreen(
            loginUsernameController: _loginUsernameController,
            loginPasswordController: _loginPasswordController,
            loginFormKey: _loginFormKey,
          ),
          tabletLayout: TabletLoginScreen(
            loginUsernameController: _loginUsernameController,
            loginPasswordController: _loginPasswordController,
            loginFormKey: _loginFormKey,
          ),
        ),
      ),
    );
  }
}
