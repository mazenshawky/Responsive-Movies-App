import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/constants.dart';
import 'package:responsive_movies_app/core/widgets/state_animation_image.dart';
import 'package:responsive_movies_app/core/widgets/state_error_button.dart';
import 'package:responsive_movies_app/core/widgets/state_error_text.dart';
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

  @override
  void initState() {
    super.initState();
    _bind();
  }

  _bind() {
    _signupUsernameController.addListener(() =>
        BlocProvider.of<SignUpCubit>(context)
            .setUserName(_signupUsernameController.text));
    _signupPasswordController.addListener(() =>
        BlocProvider.of<SignUpCubit>(context)
            .setPassword(_signupPasswordController.text));
  }

  Widget _buildSignupButtonPressedBloc() {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is SignUpLoading) {
          Constants.showPopupWidget(
            context,
            children: [
              const StateAnimationImage(animationImage: JsonAssets.loading),
            ],
          );
        }
        if (state is SignUpSuccess) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(Routes.dashboardRoute);
        }
        if (state is SignUpError) {
          Navigator.pop(context);
          Constants.showPopupWidget(
            context,
            children: [
              const StateAnimationImage(animationImage: JsonAssets.error),
              StateErrorText(text: (state).msg),
              const StateErrorButton(),
            ],
          );
        }
      },
      child: Container(),
    );
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
            buildBloc: _buildSignupButtonPressedBloc(),
          ),
          tabletLayout: TabletSignUpScreen(
            signupUsernameController: _signupUsernameController,
            signupPasswordController: _signupPasswordController,
            signupFormKey: _signupFormKey,
            buildBloc: _buildSignupButtonPressedBloc(),
          ),
        ),
      ),
    );
  }
}
