import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_assets.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/widgets/screen_image.dart';
import 'package:responsive_movies_app/modules/home/presentation/screens/components/navigate_and_logout_buttons.dart';

class TabletDashboardScreen extends StatelessWidget {
  final String helloMessage;
  final VoidCallback? logout;

  const TabletDashboardScreen({
    super.key,
    required this.logout,
    required this.helloMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: ScreenImage(
              title: helloMessage,
              image: IconAssets.dashboardIcon,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p16),
                  child: SizedBox(
                    width: AppSize.s450,
                    child: NavigateAndLogoutButtons(
                      logout: logout,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
