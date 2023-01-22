import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferences({required this.sharedPreferences});

  Future<bool> getIsUserLoggedIn() async =>
      sharedPreferences.getBool(AppStrings.isUserLoggedInKey) ?? false;

  Future<String?> getLoggedUserUsername() async =>
      sharedPreferences.getString(AppStrings.loggedUserUsernameKey);

  void logout() {
    sharedPreferences.remove(AppStrings.isUserLoggedInKey);
    sharedPreferences.remove(AppStrings.loggedUserUsernameKey);
  }
}
