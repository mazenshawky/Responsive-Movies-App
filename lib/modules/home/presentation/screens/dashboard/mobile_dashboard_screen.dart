import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/widgets/screen_image.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/components/navigate_and_logout_buttons.dart';

class MobileDashboardScreen extends StatelessWidget {
  final String helloMessage;
  final VoidCallback? logout;

  const MobileDashboardScreen({
    super.key,
    required this.logout,
    required this.helloMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScreenImage(
            title: helloMessage,
            image: IconAssets.dashboardIcon,
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: AppSize.s8,
                child: NavigateAndLogoutButtons(
                  logout: logout,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
