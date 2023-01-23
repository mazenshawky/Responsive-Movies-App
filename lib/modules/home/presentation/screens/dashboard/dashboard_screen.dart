import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/config/responsive/responsive_layout.dart';
import 'package:responsive_movies_app/config/routes/app_routes.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/widgets/background.dart';
import 'package:responsive_movies_app/core/widgets/state_animation_image.dart';
import 'package:responsive_movies_app/core/widgets/state_error_text.dart';
import 'package:responsive_movies_app/modules/home/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/mobile_dashboard_screen.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/dashboard/tablet_dashboard_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _getHelloMessage() =>
      BlocProvider.of<DashboardCubit>(context).getHelloMessage();

  void _logout(BuildContext context) {
    BlocProvider.of<DashboardCubit>(context).logout();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  void initState() {
    super.initState();
    _getHelloMessage();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
      if (state is DashboardLoading) {
        return const StateAnimationImage(animationImage: JsonAssets.loading);
      } else if (state is DashboardError) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StateAnimationImage(animationImage: JsonAssets.error),
            StateErrorText(text: (state).msg),
          ],
        );
      } else if (state is DashboardSuccess) {
        return ResponsiveLayout(
          mobileLayout: MobileDashboardScreen(
            helloMessage: (state.helloMessage),
            logout: () => _logout(context),
          ),
          tabletLayout: TabletDashboardScreen(
            helloMessage: (state.helloMessage),
            logout: () => _logout(context),
          ),
        );
      } else {
        return const StateAnimationImage(animationImage: JsonAssets.loading);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        topImage: ImageAssets.loginTop,
        bottomImage: ImageAssets.signupBottom,
        isBottomRight: false,
        child: _buildBodyContent(),
      ),
    );
  }
}
